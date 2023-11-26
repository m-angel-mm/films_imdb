# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'should save the movie' do
    movie = Movie.new(imdb_id: 'movie1', title: 'movie test', year: 2023)
    movie.save
    result = Movie.find(movie.id)

    movie.destroy
    expect(result).to eq(movie)
  end
end
