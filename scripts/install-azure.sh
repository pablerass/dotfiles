#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

$DIR/install-powershell.sh

# Install packages
sudo apt install -y azure-cli

# Install PowerShell module
sudo pwsh -c Install-Module -Name Az -AllowClobber -Scope AllUsers -Confirm
