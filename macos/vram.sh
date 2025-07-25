#!/bin/bash

GB=$((1024 ** 3))
ORIGINAL_SIZE=$(( $(sysctl -n hw.memsize) / $GB))
MAX_SIZE=$(( $(sysctl -n hw.memsize) / $GB - 6))

echo "Current total RAM capacity of this macbook is: $ORIGINAL_SIZE GB"
echo "Upper Limit is: $MAX_SIZE GB"
read -p "Please enter how much space (GB) to be used as VRAM: " SPACE

if [[ $SPACE -gt $MAX_SIZE ]]; then
    echo "Do not exceed the upper limit."
    exit 1
fi

CONVERT=$((1024 * $SPACE))
echo "Using $CONVERT GB as VRAM Compatible memory."
sudo sysctl iogpu.wired_limit_mb=$CONVERT
