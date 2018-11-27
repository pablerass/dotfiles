#!/bin/bash -e

# Specify eclipse version
url="https://search.maven.org/remote_content?g=com.madgag&a=bfg&v=LATEST"
app=bgf
dir=/opt/$app
jar=bgf.jar
exe=bgf

# Download BFG
wget -O $jar $url

# Create executable
cat <<'EOF' > $exe
#!/bin/bash

java -jar /opt/bgf/bgf.jar $@
EOF

sudo chmod a+r $jar
sudo chmod a+rx $exe

# Move files
sudo mkdir -p $dir

sudo mv $exe $dir
sudo mv $jar $dir

sudo chown root:root -R $dir

sudo ln -sf /opt/bgf/bgf /usr/local/bin/bgf
