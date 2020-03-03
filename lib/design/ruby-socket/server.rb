require 'socket'

server = TCPServer.open(3000)

# 如果不用loop那么，server处理完一个客户请求，然后就退出了。
loop do
  # 使用线程可以并发响应客户端的请求
  Thread.new(server.accept) do |client| # 这里即使使用多线程，accept还是阻塞的
    client.puts Time.now.ctime
    client.puts 'Closing the connection. Bye!'
    sleep(0.5)

    client.close
  end
end
