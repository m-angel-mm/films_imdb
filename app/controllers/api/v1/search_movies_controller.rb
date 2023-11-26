# frozen_string_literal: true

module Api
  module V1
    # Search service controller
    class SearchMoviesController < ApplicationController
      caches_action :search_movie_by_imdb_id

      def search_movie
        SearchMovieService.search_movie(params[:title])
      end

      def search_movie_by_imdb_id
        SearchMovieService.search_movie_by_imdb_id(params[:imdb_id])
      end

      private

      def sync_parameter
        params.permit(:title, :imdb_id)
      end
    end
  end
end
