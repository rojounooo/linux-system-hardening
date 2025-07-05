#!/bin/bash

# Variables
LYNIS_PATH=$1
OUTPUT_PATH=$2

# Get hardening index score 
echo "Hardening Index:" > $OUTPUT_PATH
echo "----------------" >> $OUTPUT_PATH
echo $(grep "index" $LYNIS_PATH | cut -d: -f2) >> $OUTPUT_PATH

# Get warnings 
echo "Warnings:" >> $OUTPUT_PATH
echo "----------------" >> $OUTPUT_PATH
grep "warning[]" $LYNIS_PATH | cut -d: -f2 >> $OUTPUT_PATH

# Get suggestions
echo "Suggestions:" >> $OUTPUT_PATH
echo "----------------" >> $OUTPUT_PATH
grep "suggestion[]" $LYNIS_PATH | cut -d: -f2 >> $OUTPUT_PATH