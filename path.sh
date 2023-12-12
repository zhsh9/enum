#!/bin/bash

URL=http://www.qwe.com

# dirb: file + dir
dirb $URL

# gobuster: file + dir
gobuster dir -u $URL -s 200 -b '' -w /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt
gobuster dir -u $URL -x php,html,htm -s 200 -b '' -w /usr/share/seclists/Discovery/Web-Content/raft-medium-files.txt

# feroxbuster: file + dir
feroxbuster -u $URL -x php html htm --depth 2 -t 50 -w /usr/share/wordlists/dirb/common.txt

# wfuzz: file + dir
wfuzz -c -z file,/usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt,urlencode --hc 404 -u $URL/FUZZ
wfuzz -c -z file,/usr/share/seclists/Discovery/Web-Content/raft-medium-files.txt,urlencode --hc 404 -u $URL/FUZZ.php
