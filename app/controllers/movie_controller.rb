# frozen_string_literal: true

# Movies controller
class MovieController < ApplicationController
  skip_before_action :authorize_request, only: :index
  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    movie = Movie.new(movie_parameters)
    movie.save
    redirect_to movie_index_url
  end

  def index
    @movies = Movie.page(params[:page]).per(3)
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_parameters)
    redirect_to movie_index_url
  end

  def delete
    @movie = Movie.find(params[:id])
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movie_index_url
  end

  def search
    movie = Movie.find_by(title: params[:title])
    redirect_to "/movie/show/#{movie.id}"
  end

  def unauthorized; end

  private

  def movie_parameters
    params.require(:movie).permit(:imdb_id, :title, :rating, :rank, :year)
  end
end
