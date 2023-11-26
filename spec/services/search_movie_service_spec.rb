# frozen_string_literal: true

require 'rails_helper'

# Spec movie search service
RSpec.describe SearchMovieService do
  let(:title) { 'The Kid' }
  let(:api_key) { 'k_12345678' }
  let(:imdb_url) { 'https://imdb-api.com/API/Search' }

  let(:response_body) { File.open('./spec/responses/Title tt0012349.json') }

  let(:headers) do
    {
      'Content-Type' => 'application/json',
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'
    }
  end

  describe '#search_movie' do
    it 'sends a movie search request' do
      stub_request(:get, "#{imdb_url}/#{api_key}/#{title}").with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      ).to_return(body: response_body, status: 200, headers:)
      result = described_class.search_movie(title)

      expect(result).to eq(true)
    end
  end
end
