require 'json'
require 'rest-client'

response = RestClient.get("http://reddit.com/.json")
parsed_response = JSON.parse(response)

posts = parsed_response['data']['children'].map do |post|
  {
    id: post['data']['id'],
    author: post['data']['author'],
    url: post['data']['url']
  }
end

posts.each do |post|
  puts "ID: #{post[:id]}"
  puts "Author: #{post[:author]}"
  puts "URL: #{post[:url]}"
  puts
end


