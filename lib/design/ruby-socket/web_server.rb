# 一个稍微复杂一点的http server

require 'socket'

server = TCPServer.new('localhost', 8080)

loop {
  client = server.accept
  request = client.readpartial(2048)

  puts request
  client.close
}
