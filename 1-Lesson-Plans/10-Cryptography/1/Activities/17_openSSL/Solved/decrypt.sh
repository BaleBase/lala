#!/bin/bash
if [ "$2" = "" ]; then
  echo "Help:  Requires <encrypted file name> <key file name>"
  exit
fi
msgfile=$1
keyfile=$2
key=$(grep key $keyfile | cut -d = -f 2)
iv=$(grep iv $keyfile | cut -d = -f 2)
openssl enc -pbkdf2 -nosalt -aes-256-cbc -d -in $msgfile -base64 -K $key -iv $iv > $msgfile.txt
cat $msgfile.txt
