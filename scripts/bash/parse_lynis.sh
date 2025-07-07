#!/bin/bash

# Variables
LYNIS_PATH=/var/log/lynis-report.dat # Path to the Lynis report file
OUTPUT_PATH=/home/admin/parsed_lynis_report.txt # Path to the output file

# Get hardening index score
echo "Hardening Index:" > "$OUTPUT_PATH"
echo "----------------" >> "$OUTPUT_PATH"
grep "hardening_index=" "$LYNIS_PATH" | cut -d'=' -f2 >> "$OUTPUT_PATH"
echo "" >> "$OUTPUT_PATH"

# Get warnings
echo "Warnings:" >> "$OUTPUT_PATH"
echo "----------------" >> "$OUTPUT_PATH"
grep "^warning\[\]=" "$LYNIS_PATH" | cut -d'=' -f2 >> "$OUTPUT_PATH"
echo "" >> "$OUTPUT_PATH"

# Get suggestions
echo "Suggestions:" >> "$OUTPUT_PATH"
echo "----------------" >> "$OUTPUT_PATH"
grep "^suggestion\[\]=" "$LYNIS_PATH" | cut -d'=' -f2 >> "$OUTPUT_PATH"
