require 'socket'
require 'json'         # Get sockets from stdlib

server = TCPServer.open(2000)   # Socket to listen on port 2000

loop {                          # Servers run forever

    client = server.accept
    request = client.read_nonblock(256)
    header, body = request.split("\r\n\r\n", 2)
    method = header.split[0]
    filename = header.split[1][1..-1]

    if File.exists?(filename)
      file = File.read(filename)
      client.print("HTTP/1.0 200 OK\r\nDate: #{Time.now.ctime}\r\ntext/html\r\nContent-Length: #{File.size(filename)}\r\n\r\n")
      if method == "GET"
        client.puts(file)
      elsif method == "POST"
        params = {}
        params = JSON.parse(body)
        viking = "<li>Name: #{params['viking']['name']}</li><li>Email: #{params['viking']['email']}</li>"
        client.print("HTTP/1.0 200 OK\r\nDate: #{Time.now.ctime}\r\ntext/html\r\nContent-Length: #{File.size(filename)}\r\n\r\n")
        client.puts(file.gsub("<%= yield %>", viking))
      else
        client.puts("404 Error: File Not Found")
      end
    end

    client.close                # Disconnect from the client
}
