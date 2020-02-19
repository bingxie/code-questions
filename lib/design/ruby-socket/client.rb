require 'socket'

hostname = 'localhost'
port = 3000

socket = TCPSocket.open(hostname, port)

while line = socket.gets
  p line.chop
end

socket.close
