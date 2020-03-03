require 'socket'
require 'pry'

class RequestParser
  def self.parse(request)
    method, path, version = request.lines[0].split

    {
      path: path,
      method: method,
      headers: parse_headers(request.lines[1..-1])
    }
  end

  private

  def self.parse_headers(headers)
    header_hash = {}

    headers.each do |line|
      return header_hash if line == "\r\n" #

      header, value = line.split(': ')

      header_hash[header] = value.chomp
    end

    header_hash
  end

  # def self.normalize(header)
  #   header.gsub(':', '').downcase.to_sym
  # end
end

server = TCPServer.new 5678

while session = server.accept
  # request = session.gets # 读取第一行？
  request = session.readpartial(2048)

  puts RequestParser.parse(request)

  # pass the number of bytes that you want to read from the socket as a parameter
  # puts socket.recv(100)
  # if there isn’t enough data to read, your program will ‘block’.
  # This means it will wait until there is some data available or the server closes the connection.
  # If blocking is an issue for you, check out the readpartial and read_nonblock methods from the IO class.

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3 empty new line
  session.print "Hello world! The time is #{Time.now}" # 4

  session.close
end
