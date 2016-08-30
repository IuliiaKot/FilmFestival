# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
Film.delete_all

name = %w(summer winter italy spring forever old NYC green)
name.each do |title|
  res = HTTParty.get("http://www.omdbapi.com/?t=#{title}")
  movie = res.parsed_response

  Category.create!(name: movie['Genre'].split(',').first)
  # debugger
  Film.create!(title: movie['Title'], director: movie['Director'].split(',').last, plot: movie['Plot'], poster: movie['Poster'], category_id: Category.find_by(name: movie['Genre'].split(',').first).id)

end

# movies.each do |movie|
#   Film.create!(title: movie[:title], director: movie[:director], description: movie[:plot], image_url: movie['Poster'])
# end
