#!/usr/bin/env bash

for bashrc_file in *.bashrc; do
    if ! grep -qF 'source shared/projectx/project.bashrc' $bashrc_file; then
        echo "source shared/projectx/project.bashrc" >> $bashrc_file
    fi
done
