#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Use the first argument as the environment name, or prompt if not provided
if [ -z "$1" ]; then
  read -p "Enter the name of the new conda environment: " env_name
else
  env_name=$1
fi

echo "Using environment name: $env_name"

# Remove the environment if it already exists
echo "Removing any existing environment named $env_name..."
conda env remove -n $env_name -y

# Create a new conda environment with Python 3.12
echo "Creating a new conda environment named $env_name with Python 3.12..."
conda create -n $env_name python=3.12 -y

# Install the required packages from conda-forge, including pip
echo "Installing packages: pandas scikit-learn matplotlib seaborn fynance pip..."
conda install -n $env_name -c conda-forge pandas scikit-learn matplotlib seaborn fynance pip -y

echo "Environment $env_name created and packages installed successfully."


