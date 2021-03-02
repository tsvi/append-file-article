#!/usr/bin/env bash

source_str='source shared/projectx/project.bashrc'
for bashrc_file in *.bashrc; do
    sed -i -e "\|$source_str|h;"     `# Search for the source string and copy it to the hold space`       \
           -e "\${"                  `# Go to the end of the file and run the following commands`         \
           -e "x;"                   `# Exchange the last line with the hold space`                       \
           -e "s|$source_str||;"     `# Erase the source string if it was actually found`                 \
           -e "{g;"                  `# Bring back the last line`                                         \
           -e "t};"                  `# Test if the substitution succeeded (the source string was found)` \
           -e "a\\" -e "$source_str" `# Append the source string if we didn't move to the next cycle`     \
           -e "}" $bashrc_file &
done
