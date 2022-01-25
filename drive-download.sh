#!/bin/bash

fileId=$1

fileName=$2

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${fileId}" > /dev/null

code="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  

curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${code}&id=${fileId}" -o ${fileName}

