#!/usr/bin/env bash

for bashrc_file in *.bashrc; do
     awk -v source_str="$source_str" \
         '{print}; $0~source_str {found=1}; END {if (!found) {print source_str}}' $bashrc_file > tempfile=$(mktemp)
     mv $tempfile $bashrc_file
done
