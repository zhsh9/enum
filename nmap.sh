#!/bin/bash

# prepare work env
mkdir -p nmap file server crypto vuln priv

# config remote and local ip into env var
# IP=x.x.x.x

# nmap scan:
# - port, version, script, os, udp
PORT=$(sudo nmap -sT --min-rate 10000 -p- $IP -oA nmap/ports | grep -E '^[0-9]+/tcp.*(open|filtered)' | awk -F '/' '{print $1}' | paste -sd ',')
sudo nmap -sT -sV -sC -O -p $PORT $IP -oA nmap/detail
sudo nmap --script=vuln -p $PORT $IP -oA nmap/vuln
sudo nmap -sU --top-ports 20 $IP -oA nmap/udp
