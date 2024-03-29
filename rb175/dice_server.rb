require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(request_line)
  http_method, path_and_params, http = request_line.split
  path, params = path_and_params.split('?')
  params = params.split('&').map { |pair| pair.split('=') }.to_h
  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line

  http_method, path, params = parse_request(request_line)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  rolls.times { client.puts rand(1..sides) }

  client.puts "</body>"
  client.puts "</html>"
  client.close
end