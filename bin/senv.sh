#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ENV=$1

# Get environment if not specified
if [ -z $ENV ]; then
	read -p "Environment: " ENV
fi

echo "AWS environment"
$DIR/senv-aws.sh $ENV

echo "SSH environment"
$DIR/senv-ssh.sh $ENV
