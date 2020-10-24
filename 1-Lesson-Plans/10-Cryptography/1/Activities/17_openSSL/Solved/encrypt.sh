#!/bin/bash
if [ "$2" = "" ]; then
  echo "Help:  Requires <plaintext file name> <key file name>"
  exit
fi
txtfile=$1
keyfile=$2
key=$(grep key $keyfile | cut -d = -f 2)
iv=$(grep iv $keyfile | cut -d = -f 2)
openssl enc -pbkdf2 -nosalt -aes-256-cbc -in $txtfile -out $txtfile.enc -base64 -K $key -iv $iv > $txtfile.enc
cat $txtfile.enc
