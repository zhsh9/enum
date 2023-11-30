#!/bin/bash

# prepare work env
mkdir -p nmap file server crypto vuln priv

# config remote and local ip into env var
echo '#pwk work env' >> ~/.zshrc
echo 'export IP=x.x.x.x' >> ~/.zshrc
echo 'export LOCAL=x.x.x.x' >> ~/.zshrc
source ~/.zshrc

# nmap scan:
# - port, version, script, os, udp
PORT=$(sudo nmap -sT --min-rate 10000 -p- $IP -oA nmap/ports | grep open | awk -F '/' '{print $1}' | paste -sd ',')
sudo nmap -sT -sV -sC -O -p $PORT $IP -oA nmap/detail
sudo nmap --script=vuln -p $PORT $IP -oA nmap/vuln
sudo nmap -sU --top-ports 20 $IP -oA nmap/udp
