#!/bin/bash

URL=http://www.qwe.com

# wfuzz
wfuzz -z range,0-10 --hl 99 $URL/file.php?cat=FUZZ
wfuzz -c -w /GitClone/Arjun/db/params.txt --hw 99 $URL/FUZZ=FUZZ

# arjun
arjun -u $URL/file.ext
