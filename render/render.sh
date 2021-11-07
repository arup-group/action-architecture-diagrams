#!/bin/bash

pwd
echo "EXPORT: $1"
echo "RENDER: $2"
mkdir $2

for import in $1/*.mmd; do
    filename="$(basename "$import")"
    export="$2/${filename%.*}.png"
    mmdc -p /puppeteer-config.json -c /mmdc.json -i $import -o $export
done
ls -la $1
ls -la $2
