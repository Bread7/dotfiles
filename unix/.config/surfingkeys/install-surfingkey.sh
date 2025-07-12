#!/bin/bash

git clone https://github.com/brookhong/Surfingkeys.git
cd Surfingkeys
pnpm install
browser=firefox pnpm run build:prod
