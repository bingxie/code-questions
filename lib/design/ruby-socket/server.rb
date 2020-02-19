require 'socket'

server = TCPServer.open(3000)

# 如果不用loop那么，server处理完一个客户请求，然后就退出了。
loop do
  # 使用线程可以并发响应客户端的请求
  Thread.new(server.accept) do |client|
    client.puts Time.now.ctime
    client.puts 'Closing the connection. Bye!'
    sleep(0.5)
    client.close
  end
end
