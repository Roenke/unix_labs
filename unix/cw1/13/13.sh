#!/bin/bash
dir=$(readlink -f $1)
cd "$dir"
tar_name=$(basename "$dir")

find "$1"/* -size -100c -exec tar -czvf "$tar_name.tar.gz" {} \;
