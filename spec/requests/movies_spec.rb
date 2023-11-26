# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Movie requests', type: :request do
  let(:headers) do
    {
      'Authorization' => JsonWebToken.encode(user_id: 1)
    }
  end

  describe 'GET /' do
    let(:movie_index) { '/' }
    Movie.all
    it '/ show login page' do
      get movie_index
      expect(response).to have_http_status(200)
      expect(response).to render_template('login')
    end
  end

  describe 'GET /movies' do
    let(:movie_show) { '/movie/show/' }
    movie = Movie.new({ id: 5000, imdb_id: 40, title: Faker::Movie.title, rating: 100,
                        rank: 60, year: 2000 })
    movie.save
    it '/show show movie information' do
      get(movie_show + movie.id.to_s, params: {}, headers:)
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
  end

  describe 'POST /movies' do
    let(:movie_new) { '/movie/new' }
    it '/new save movie information' do
      post(movie_new, params: { movie: { imdb_id: 47, title: Faker::Movie.title, rating: 600,
                                         rank: 51, year: 2004 } }, headers:)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to '/index'
    end
  end
end
