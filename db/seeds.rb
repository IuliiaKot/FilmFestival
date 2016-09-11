# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Category.delete_all
Film.delete_all
CategoryFilm.delete_all
Review.delete_all

name = %w(summer winter italy spring forever old green wall wife happy life)
name.each do |title|
  res = HTTParty.get("http://www.omdbapi.com/?t=#{title}")
  # debugger
  movie = res.parsed_response
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
    else
      Film.last.categories << Category.find_by(name: category)
    end
  end
end


User.create!(username: "DBC",
                  email: 'db34@gmail.com',
                  first_name: 'Andry',
                  password: '123456')

User.create!(username: "Star",
                  email: 'arcadia@gmail.com',
                  first_name: 'Alina',
                  password: '123456')
User.create!(username: "Storm",
                  email: 'julia@gmail.com',
                  first_name: 'Julia',
                  password: '123456')
Film.all[8].reviews.create!(user_id: User.first.id,
                        rating: 4,
                        content: "On a cold winter's night Clare (Rachel McAdams) confesses to her husband Henry (Eric Bana), 'I wouldn't change a second of our life together.' McAdams and Bana are both beautiful and amazing in Director Robert Schwentke's 'The Time Traveler's Wife' based on the bestselling novel by Audrey Niffenegger. 'The Time Traveler's Wife' adapted by screenwriter Bruce Joel Rubin is a bitter sweet and strange love story. It is not perfect; although, it ends perfectly. There is a timeless and yearning quality that engages in 'The Time Traveler's Wife'. However, Schwentke and Rubin might have leveraged sharper emotional arcs at particular narrative points. During the course of their lives, Clare and Henry experience tragedy and joy. In spite of this, Rachel McAdams is stunning. I am in love with her. Bana is powerful and moving.")


Film.all[8].reviews.create!(user_id: User.second.id,
                        rating: 4,
                        content: "Something I often find bothersome in 'time travel fiction' is that there is usually a large chunk of the storytelling dedicated to the tedium of explaining 'how' time travel works, particularly when time travel is merely a device to aid the storytelling. We don't really need to know the science behind it because, simply put, science can neither logically explain its paradoxical nature, nor prove or dispute its possibility. 'The Time Traveler's Wife' never makes pretenses to the science behind it, rather it centers its focus on the story.")



Film.all[0].reviews.create!(user_id: User.last.id,
                        rating: 5,
                        content: "It is not unreasonable to say that Rohmer's films are without par. No director has ever come close to his exquisite and acute observations of the human psyche, and so Rohmer's films are probably only comparable to each other. I find that the more films of his that I watch, the more I am able to see each film clearer. It is no wonder that out of the directors that emerged from the French New Wave, only Rohmer has been able to sustain critical acclaim for his films consistently.

                        Many detractors find fault with his style -- there is little or no music, the plot is only a very very rough skeleton of what actually goes on in his films (as it takes a backseat to exploring the psychology of his characters), there are many moments of silence, and those moments of dialog are mostly ramblings about philosophy, love, and life instead of plot advancement. Well, I find it quite difficult to articulate the charm of his movies too, since he isn't particularly flashy in his writing or his direction.

                        His films are largely introspective, drawing us in to view the character's psyche instead of the events that happen to him, as such his films are always introverted and quiet, where it seems nothing much happens. At first glance, the lead characters of his films seem to be all from the same mold: gloomy, quiet people who are extremely prone to making fickle choices and outbursts of emotion. But the more Rohmer you see, the more likely you'd be to distinguish a pattern among them and their distinctive traits in his characters.")


Film.all[0].reviews.create!(user_id: User.second.id,
                        rating: 4,
                        content: "We have been conditioned as a culture to believe that happiness lies in an ideal, future state. For example, we think it will all turn out when we finish school, when we get a job, when we get married, when we have children, then when we get divorced, or when we retire. It is always something or someplace more, better, or different but the more things change, the more they seem to remain the same. In Summer, aka The Green Ray, one of Eric Rohmer's most insightful and charming films, Delphine (Marie Riviere) is a young, intelligent, and good-looking Parisian secretary who has spent her life looking for 'Mr Right'. Like many who spend their life 'searching', she is a perfectionist who keeps people away by maintaining impossible standards, then feels inadequate and unloved when things do not work out. She is interesting rather than interested.")


Film.all[0].reviews.create!(user_id: User.first.id,
                        rating: 5,
                        content: "Rohmer´s movies show ordinary people in common situations,

                        discovering the magic, the loneliness, the doubts and passions that hide behind the dull façade of modernity. There are no superstars, there´s no great music, there aren't magnificent dialogues, just real, natural, ordinary images that become extraordinary precisely because of their simplicity. In the 'Rayon Vert', the image of a young woman hearing the noise of the wind in a rural landscape that brings her face to face with the dreaded consciousness of her loneliness, is one of the greatest movie scenes I´ve seen in my life.")



Film.all[2].reviews.create!(user_id: User.last.id,
                        rating: 2,
                        content: "Apart from the beautiful scenery, and a couple of chuckles, this was boring. Normally I enjoy these guys, but this just doesn't work. Watching two mates eating, and doing impressions every five minutes, with an attempt at being funny thrown in, was embarrassing. I was hoping for more views of an amazing journey, but was left feeling short changed in that department. Whilst both Rob and Steve are very clever in their own right, this union seemed more of a challenge to outdo each other. I thought this would be more of a documentary type of movie, but sadly I was mistaken. If you're die hard fans of the duo, I guess this is for you.")
