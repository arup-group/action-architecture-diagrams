#!/bin/sh

echo "DSL: $1"
ls -la $1

echo "EXPORT: $2"
mkdir $2
ls -la $2
java -cp /usr/local/structurizr-cli:/usr/local/structurizr-cli/lib/* com.structurizr.cli.StructurizrCliApplication export -w $1 -o $2 -f mermaid
