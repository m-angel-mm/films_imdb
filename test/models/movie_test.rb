# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  imdb_id    :string
#  title      :string
#  rating     :decimal(, )
#  rank       :integer
#  year       :integer
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
