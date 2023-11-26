# frozen_string_literal: true

# find film service
class FindFilm
  def find_film(id)
    Movie.find(id)
  end
end
