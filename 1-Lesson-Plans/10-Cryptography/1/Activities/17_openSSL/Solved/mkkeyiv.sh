#!/bin/bash
if [ "$2" = "" ]; then
  echo "Help:  Requires <password> <key file name>"
  exit
fi
password=$1
keyfile=$2
openssl enc -pbkdf2 -nosalt -aes-256-cbc -k $password -P > $keyfile
cat $keyfile
