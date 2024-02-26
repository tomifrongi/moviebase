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
class Film < ApplicationRecord
  has_many :film_casts
  has_many :actors, through: :film_casts
  has_one :source

  validates :title, :genre, :release_date, :score, presence: true
  validates :score, numericality: { only_integer: false, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  scope :by_genre, ->(genre) { where('genre LIKE ?', "%#{genre}%") }

  class << self
    %i[action drama comedy science_fiction historical horror suspense fantasy].each do |genre|
      define_method(genre) { by_genre(genre) }
    end
  end
end
