#!/bin/bash

# Uses displayplacer for builtin display config
if ! command -v displayplacer; then
    echo "Displayplacer not found. Please install displayplacer first."
    exit 1
fi

DEGREE="0"
ORIGIN="(0,0)"
MODE=$(displayplacer list | grep 2560x1600 | grep hz:120 | head -1 | awk '{print $2}')
ID=$(displayplacer list | rg -B 5 built | rg "Persistent" | awk '{print $4}')
# Remove ":" from the string
# echo ${MODE%?}

echo "Configuring MacOS screen with 2560x1600 120hz resolution"
displayplacer "id:$ID res:2560x1600 hz:120 color_depth:8 scaling:off origin:(0,0) degree:0"
