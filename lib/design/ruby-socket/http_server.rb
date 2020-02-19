require 'socket'
server = TCPServer.new 5678

while session = server.accept
  request = session.gets

  # pass the number of bytes that you want to read from the socket as a parameter
  # puts socket.recv(100)
  # if there isn’t enough data to read, your program will ‘block’.
  # This means it will wait until there is some data available or the server closes the connection.
  # If blocking is an issue for you, check out the readpartial and read_nonblock methods from the IO class.
  puts request

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3 empty new line
  session.print "Hello world! The time is #{Time.now}" # 4

  session.close
end
