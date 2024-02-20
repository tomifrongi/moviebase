# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  format     :string
#  path       :string
#  runtime    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  film_id    :integer          not null
#
# Indexes
#
#  index_sources_on_film_id  (film_id)
#
# Foreign Keys
#
#  film_id  (film_id => films.id)
#
class Source < ApplicationRecord
  belongs_to :film, class_name: 'film', foreign_key: 'film_id'
  validates :format, :path, :runtime, presence: true
end
