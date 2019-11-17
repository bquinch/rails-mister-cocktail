# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
# puts ingredients
ingredients['drinks'].each do |ingredient|
  newingredient = Ingredient.new(name: ingredient["strIngredient1"])
  newingredient.save!
end

alphabet = ('a'..'z').to_a
alphabet.each do |letter|
  unless JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}").read)['drinks'].nil?
    cocktails = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}").read)['drinks']
    cocktails.each do |cocktail|
      some_cocktail = Cocktail.find_by(name: cocktail['strDrink'])
      if some_cocktail.nil?
        my_cocktail = Cocktail.new(name: cocktail['strDrink'], instruction: cocktail['strInstructions'].gsub(/([\n|\r])/, ''))
        puts "Adding #{my_cocktail.name} to the database"
        file = open(cocktail['strDrinkThumb'])
        my_cocktail.photo.attach(io: file, filename: "#{cocktail['strDrinkThumb'][-15..-1]}")
        if my_cocktail.valid?
          puts "It's valid !"
          my_cocktail.save
          numbers = (1..5).to_a
          numbers.each do |number|
            unless cocktail["strMeasure#{number}"].nil? || Ingredient.find_by(name: cocktail["strIngredient#{number}"]).nil?
              dose = Dose.new(description: cocktail["strMeasure#{number}"])
              ingredient = Ingredient.find_by(name: cocktail["strIngredient#{number}"])
              dose.cocktail = my_cocktail
              dose.ingredient = ingredient
              if dose.valid?
                dose.save!
              end
            end
          end
        end
      else
        puts "#{some_cocktail.name} already exists !"
      end
    end
  end
end
