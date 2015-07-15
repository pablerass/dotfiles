#!/bin/bash

# Specify eclipse version
url="https://search.maven.org/remote_content?g=com.madgag&a=bfg&v=LATEST"
dir=/opt/bgf
jar=bgf.jar
exe=bgf

# Download BFG
wget -O $jar $url

# Create executable
cat <<'EOF' > $exe
#!/bin/bash

java -jar /opt/bgf/bgf.jar $@
EOF

sudo chmod a+x $exe

# Move files
sudo mkdir $dir

sudo mv $exe $dir/$exe
sudo mv $jar $dir

sudo ln -s /opt/bgf/bgf /usr/local/bin/bgf
