# == Schema Information
#
# Table name: film_casts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer          not null
#  film_id    :integer          not null
#
# Indexes
#
#  index_film_casts_on_actor_id  (actor_id)
#  index_film_casts_on_film_id   (film_id)
#
require 'test_helper'

class FilmCastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
