#!/bin/bash

# Prompt the user for the environment name
read -p "Enter the name of the new conda environment: " env_name

# Remove the environment if it already exists
echo "Removing any existing environment named $env_name..."
conda env remove -n $env_name -y

# Create a new conda environment with Python 3.10
echo "Creating a new conda environment named $env_name with Python 3.10..."
conda create -n $env_name python=3.10 -y

# Activate the new environment
echo "Activating the new environment..."
source activate $env_name

# Install the required packages
echo "Installing packages: pandas, scikit-learn, tensorflow, seaborn..."
conda install pandas scikit-learn tensorflow seaborn -y

echo "Environment $env_name created and packages installed successfully."

# Deactivate the environment
echo "Deactivating the environment..."
conda deactivate

