#!/bin/bash

hexaddr=$(awk '$2 == "00000000" {print $3}' /proc/net/route)
ipaddr=$(printf "%d." $(
  echo $hexaddr | sed 's/../0x& /g' | tr ' ' '\n' | tac
  ) | sed 's/\.$/\n/')

cat >> /etc/apt/sources.list <<REPOS
deb http://${ipaddr}/repos/cuda-repo-8-0-local /
deb http://${ipaddr}/repos/nv-gie-repo-ga-cuda8.0-gie1.0-20170116 /
REPOS

wget -qO- http://${ipaddr}/repos/cuda-repo-8-0-local/7fa2af80.pub | apt-key add -
