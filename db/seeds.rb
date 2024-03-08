# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
data = JSON.parse(response)

Movie.destroy_all

data['results'].each do |film|
  puts film['title']
  Movie.create(title: film['title'],
    overview: film['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{film['poster_path']}",
    rating: film['vote_average'])
end
