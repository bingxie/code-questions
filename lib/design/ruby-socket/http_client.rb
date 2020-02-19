require 'socket'

host = 'www.bigbing.net'     # The web server
port = 80                           # Default HTTP port
path = '/'                 # The file we want

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port) # Connect to server or #new
socket.print(request)               # Send request

response = socket.read              # Read complete response

# Split response at first blank line into headers and body
headers, body = response.split("\r\n\r\n", 2)
puts headers
puts body # And display it
