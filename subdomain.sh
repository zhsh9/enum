#!/bin/bash

URL=http://qwe.com/
DNS_SERVER=8.8.8.8

# gobuster
## DNS mode, to  DNS resolve the subdomains and based on that we are given the result
gobuster dns -d $URL -i -r $DNS_SERVER -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt

## VHOST mode, to check if the subdomain exists by visiting the formed url and verifying the IP address
gobuster vhost -u $URL --append-domain -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt
