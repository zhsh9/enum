#!/bin/bash

IP=x.x.x.x

enum4linux -A $IP
crackmapexec smb $IP
smbmap -H $IP
smbclient -L //$IP -N
