#!/bin/bash

wpscan -e ap,at,tt,cb,dbe,u,m --plugins-detection aggressive --url $URL
