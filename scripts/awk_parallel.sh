#!/usr/bin/env bash

source_str='source shared/projectx/project.bashrc'
for bashrc_file in *.bashrc; do
    ( tempfile=$(mktemp)
      awk -v source_str="$source_str" \
        '{print}; $0~source_str {found=1}; END {if (!found) {print source_str}}' $bashrc_file > $tempfile
      mv $tempfile $bashrc_file ) &
done
