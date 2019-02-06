#!/bin/bash -e

# Specify eclipse version
url="https://search.maven.org/remote_content?g=com.madgag&a=bfg&v=LATEST"
app=bfg
dir=/opt/$app
jar=bfg.jar
exe=bfg

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

sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
