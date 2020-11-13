# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
ingredients = JSON.parse(list_serialized)
list = ingredients["drinks"]

puts "Cleaning database..."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all
sleep 1

puts "Creating data..."

list.each do |ingredient|
  zutat = Ingredient.new(name: ingredient["strIngredient1"])
  zutat.save
end
sleep 2

puts "Finished! #{Ingredient.count} - ingredients created"

drinks = ['Mojito', 'Long Island Iced Tea', 'Manhattan', 'Daiquiri', 'Margarita', 'Bloody Mary', 'Cosmopolitan', 'Sangria', 'Moscow Mule', 'Screwdriver', 'Tequila Sunrise', 'Martini']
drinks.each do |drink|
  Cocktail.create!({ :name => drink })
end

puts 'Drink Names loaded...'

