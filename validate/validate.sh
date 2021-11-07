#!/bin/sh

echo "DSL: $1"
java -cp /usr/local/structurizr-cli:/usr/local/structurizr-cli/lib/* com.structurizr.cli.StructurizrCliApplication validate -w $1
