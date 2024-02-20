# == Schema Information
#
# Table name: films
#
#  id           :integer          not null, primary key
#  genre        :string
#  release_date :date
#  score        :float
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
