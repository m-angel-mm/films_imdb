# frozen_string_literal: true

# Create movie index
class AddIndexToMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :movies, :title
  end
end
