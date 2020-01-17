#!/bin/bash -e

dir=$()

$dir/install-powershell.sh

# Install packages
sudo apt install -y azure-cli

# Install PowerShell module
sudo pwsh -c Install-Module -Name Az -AllowClobber -Scope AllUsers -Confirm
