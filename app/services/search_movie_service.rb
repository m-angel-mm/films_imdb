# frozen_string_literal: true

require 'erb'

# Search movie service
class SearchMovieService
  IMDB_URL = 'https://imdb-api.com/API'

  def self.search_movie(title)
    response = HTTParty.get("#{IMDB_URL}/Search/#{ENV.fetch('API_KEY', nil)}/#{ERB::Util.url_encode title}")
    movie_info = JSON.parse(response.body)

    movie = Movie.find_or_initialize_by(imdb_id: movie_info['id'], title: movie_info['title'],
                                        rating: movie_info['imDbRating'], rank: movie_info['ratings'],
                                        year: movie_info['year'])
    movie.save
  end

  def self.search_movie_by_imdb_id(imdb_id)
    response = HTTParty.get("#{IMDB_URL}/Title/#{ENV.fetch('API_KEY', nil)}/#{imdb_id}")
    movie_info = JSON.parse(response.body)

    movie = Movie.find_or_initialize_by(imdb_id: movie_info['id'], title: movie_info['title'],
                                        rating: movie_info['imDbRating'], rank: movie_info['ratings'],
                                        year: movie_info['year'])
    movie.save
  end
end
