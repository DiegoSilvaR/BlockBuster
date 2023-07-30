require 'httparty'
require 'json'
require 'faker'

def fetch_random_movie_data(api_key)
  url = "https://api.themoviedb.org/3/discover/movie?api_key=#{api_key}&language=en-US&sort_by=popularity.desc&page=#{rand(1..100)}"
  response = HTTParty.get(url)
  results = JSON.parse(response.body)['results']
  random_movie = results.sample

  { title: random_movie['title'], cover_image_url: "https://image.tmdb.org/t/p/original#{random_movie['poster_path']}" }
end

api_key = '00a19588b0b75f8f1b5ccda7c57cce5a'

# Seed de Clientes
30.times do
  Client.create!(
    name: Faker::Name.name,
    age: Faker::Number.between(from: 18, to: 100)
  )
end

# Seed de Películas
200.times do
  movie_data = fetch_random_movie_data(api_key)

  movie = Movie.new(name: movie_data[:title], cover_image_url: movie_data[:cover_image_url]) # Guardamos la URL en lugar de la imagen

  # Asociar una película aleatoria a un cliente aleatorio
  #movie.client = Client.all.sample

  movie.save!
end
