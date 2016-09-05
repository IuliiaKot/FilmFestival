# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
Film.delete_all
CategoryFilm.delete_all

name = %w(summer winter italy spring forever old green wall)
name.each do |title|
  res = HTTParty.get("http://www.omdbapi.com/?t=#{title}")
  # debugger
  movie = res.parsed_response

  # movie['Genre'].split(', ').each do |category|
  #   Category.create!(name: category) if !Category.find_by(name: category)
  # end
  # Category.create!(name: movie['Genre'].split(',').first)
  # debugger
  Film.create!(title: movie['Title'],
              director: movie['Director'],
              plot: movie['Plot'],
              year: movie['Year'],
              released: movie['Released'],
              runtime: movie['Runtime'],
              writer: movie['Writer'],
              poster: movie['Poster'])

  movie['Genre'].split(', ').each do |category|
    if !Category.find_by(name: category)
      Film.last.categories << Category.create!(name: category)
    end
  end
end

# movies.each do |movie|
#   Film.create!(title: movie[:title], director: movie[:director], description: movie[:plot], image_url: movie['Poster'])
# end
