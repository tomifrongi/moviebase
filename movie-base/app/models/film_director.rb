# == Schema Information
#
# Table name: film_directors
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer          not null
#  film_id     :integer          not null
#
# Indexes
#
#  index_film_directors_on_director_id  (director_id)
#  index_film_directors_on_film_id      (film_id)
#
class FilmDirector < ApplicationRecord
  belongs_to :film
  belongs_to :director
end
