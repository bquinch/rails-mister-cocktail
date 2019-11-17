require 'open-uri'
require 'json'

def ingredients_creation
  url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
  JSON.parse(URI.parse(url).open.read)['drinks'].each do |ingredient|
    newingredient = Ingredient.new(name: ingredient['strIngredient1'])
    newingredient.save!
  end
end

def cocktails_creation
  ('a'..'z').to_a.each do |letter|
    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}"
    next if JSON.parse(URI.parse(url).open.read)['drinks'].nil?

    make_doses_and_cocktails(url)
  end
end

def make_doses_and_cocktails(url)
  JSON.parse(URI.parse(url).open.read)['drinks'].each do |c|
    doses_creation(c, create_cocktail(c))
  end
end

def create_cocktail(cocktail)
  new_cocktail = Cocktail.new(
    name: cocktail['strDrink'],
    instruction: cocktail['strInstructions'].gsub(/([\n|\r])/, '')
  )
  new_cocktail.photo.attach(
    io: URI.parse(cocktail['strDrinkThumb']).open,
    filename: cocktail['strDrinkThumb'][-15..-1]
  )
  new_cocktail.save if new_cocktail.valid?
  new_cocktail
end

def random_reviews(cocktail)
  rand(1..4).times do
    review = Review.new(
      content: Faker::Marketing.buzzwords,
      author: Faker::Name.name,
      rating: rand(1..5)
    )
    review.cocktail = cocktail
    review.save! if review.valid?
  end
end

def reviews_creation
  Cocktail.all.each do |c|
    random_reviews(c)
  end
end

def doses_creation(cocktail, new_cocktail)
  (1..5).to_a.each do |number|
    next if cocktail["strMeasure#{number}"].nil? || Ingredient.find_by(
      name: cocktail["strIngredient#{number}"]
    ).nil?

    dose = Dose.new(description: cocktail["strMeasure#{number}"])
    ingredient = Ingredient.find_by(name: cocktail["strIngredient#{number}"])
    dose.cocktail = new_cocktail
    dose.ingredient = ingredient
    dose.save! if dose.valid?
  end
end

def seed_all
  ingredients_creation
  cocktails_creation
  reviews_creation
end

seed_all
