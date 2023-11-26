# frozen_string_literal: true

# Form validation
class FilmFormValidator
  include ActiveModel::Model

  attr_accessor :title, :year, :data

  validates_presence_of :title, :year, :data
end
