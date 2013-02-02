#!/usr/bin/env python

import os
import BaseHTTPServer
import CGIHTTPServer
import cgitb; cgitb.enable()  ## This line enables CGI error reporting

try:
	PORT = int(os.environ['PORT'],10)
except:
	PORT = 8089
try:
	HOST = os.environ['HOST']
except:
	HOST = '127.0.0.1'


server = BaseHTTPServer.HTTPServer
handler = CGIHTTPServer.CGIHTTPRequestHandler
server_address = (HOST, PORT)
#this breaks the cgi-bin#handler.cgi_directories = ["cgi-bin"]

httpd = server(server_address, handler)
httpd.serve_forever()

