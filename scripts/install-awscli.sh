#!/bin/bash -e

# Install packages
#	jq - enables json parsing from bash
sudo apt-get install jq -y

# Install python libs
sudo -H pip install -U awscli #awsebcli s3cmd

# Install ECS Cli
#sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
#sudo chmod +x /usr/local/bin/ecs-cli

