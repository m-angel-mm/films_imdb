# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies search', type: :request do
  let(:service_response) { Movie.new({ imdb_id: 'tt0012349', title: 'The Kid', year: '1921', rank: 8, rating: 10 }) }
  let(:movies_search_uri) { '/api/v1/search' }
  let(:headers) do
    {
      'Authorization' => JsonWebToken.encode(user_id: 1),
      'Content-Type' => 'application/json'
    }
  end
  describe 'GET /search' do
    it 'get movie by title' do
      allow(SearchMovieService).to receive(:search_movie).with('The Kid').and_return(service_response)

      get(movies_search_uri, params: { title: 'The Kid' }, xhr: true, headers:)
      expect(response).to have_http_status(204)
    end
  end
end
