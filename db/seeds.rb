# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'rest-client'
require 'rails/configuration'

url = "https://api.thecatapi.com/v1/images/search"

data = JSON.parse(RestClient.get(url, {'x-api-key' => 'd34bb7f3-c194-48d3-9109-b5e22567fd7e', params: {limit: 20, has_breeds: 1}}))

data.each do |cat|
  unless Breed.find_by(id: cat["breeds"][0]["id"])
    Breed.create(id: cat["breeds"][0]["id"], name: cat["breeds"][0]["name"], origin: cat["breeds"][0]["origin"])
  end
  Cat.create(id: cat['id'], url: cat['url'], width: cat['width'], height: cat['height'], breed_id: cat["breeds"][0]["id"])
end