#!/bin/bash

# List all conda environments
envs=$(conda env list | awk '{print $1}' | grep -v "#")

# Loop through each environment and show detailed information
for env in $envs; do
    echo "Environment: $env"
    conda list -n $env
    echo "----------------------------------------"
done

