require 'socket'
require 'pry'

def welcome(chatter)
  chatter.print 'Welcome! Please enter your name: '
  chatter.readline.chomp
end

def broadcast(message, chatters)
  _, writable_chatters, _ = IO.select(nil, chatters, nil)

  writable_chatters.each do |chatter|
    chatter.puts message
  end
end

s = TCPServer.new(3939)
chatters = []
puts 'Chat server started at 3939'

while (chatter = s.accept)
  Thread.new(chatter) do |c|
    chatters << chatter

    name = welcome(chatter, chatters)
    broadcast("#{name} has joined", chatters)

    begin
      loop do
        line = c.readline
        broadcast("#{name}: #{line}", chatters)
      end
    rescue EOFError
      c.close
      chatters.delete(c)
      broadcast("#{name} has left", chatters)
    end
  end
end
