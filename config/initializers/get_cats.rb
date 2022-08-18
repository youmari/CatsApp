# require 'rest-client'
# require 'rails/configuration'

# url = "https://api.thecatapi.com/v1/images/search"

# data = JSON.parse(RestClient.get(url, {'x-api-key' => 'd34bb7f3-c194-48d3-9109-b5e22567fd7e', params: {limit: 20, has_breeds: 1}}))

# data.each_with_index do |cat, i|
#   # puts cat["breeds"][0]["name"]
#   # puts cat['url']
#   puts Breed.find(cat["breeds"][0]["id"])
  
# end
