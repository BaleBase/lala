#!/usr/bin/env bash

# Variables
LAB_ENV_DIR="$HOME/Documents/LabEnvironments"
SCAVENGER_DIR="$LAB_ENV_DIR/linux-scavenger"
VAGRANTFILE_URL="https://tinyurl.com/yaupb8tf"

# Create Environment & Download Vagrantfile
echo "Creating $SCAVENGIR_DIR and downloading Vagrantfile..."
mkdir -p "$SCAVENGER_DIR" && cd "$_"
curl -s -L -o Vagrantfile $VAGRANTFILE_URL

# Lift Machine and Install Reprovisioner
vagrant up

# Tell Students how to Connect
SSH_USERNAME="student"
PORT=$(vagrant ssh-config | grep -i 'port' | awk '{print $2}' | sed 's/\s*//g')

echo "Your Scavenger Hunt environment has been installed to $(pwd)!"
echo -e "\nConnect via SSH by running: ssh $SSH_USERNAME@192.168.1.105"