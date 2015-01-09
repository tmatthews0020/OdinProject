require 'socket'
require "json"

  host = 'localhost'     # The web server
  port = 2000                           # Default HTTP port



  puts "This is a Simple Browser!"
  puts "What would you like to do?"
  puts "g -> GET"
  puts "p -> POST"

  http = gets.chomp

  if http == "g"
    path = "/index.html"
    request = "GET #{path} HTTP/1.0\r\n\r\n"
  elsif http == "p"
    path = "/thanks.html"
    puts "What is the Vikings Name?"
    name = gets.chomp
    puts "What is the Vikings Email?"
    email = gets.chomp
    viking_hash = {:viking => {:name=> name, :email=> email}}.to_json
    request = "POST #{path} HTTP/1.0\r\nFrom: #{email}\r\nUser-Agent: SimpleBrowser\r\nContent-Type: application/json\r\nContent-Length: #{viking_hash.to_s.length}\r\n\r\n#{viking_hash}"

  else
    "I don't know that action!"
    exit
  end







socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2)
print body
socket.close                        # And display it
