require 'socket'

class Server
  def initialize(port)
    @response = "HTTP/1.1 200 OK \r\n Content-Type: text/plain \r\n\r\n"
    @socket = TCPServer.new port
  end

  def connect_server
    while session = @socket.accept
      request = session.gets

      session.puts @response + "Hello World!"
      session.close
    end
  end
end

port = 3000
server = Server.new(port).connect_server
