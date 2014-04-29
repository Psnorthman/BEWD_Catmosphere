require 'JSON'
require 'rest-client'

url ="http://api.wunderground.com/api/08738f785dd44a69/astronomy/q/USA/.json"

response = RestClient.get(url)
parsed_response = JSON.parse(response)

posts = parsed_response["response"]["results"].map do |post|
	{
		city: post["city"],
		state: post["state"]
	}
end

posts.each do |post|
	puts "City: #{post[:city]}"
	puts "State: #{post[:state]}"
end

