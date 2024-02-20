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

  scope :action, -> { where(genre: 'Action') }
  scope :drama, -> { where(genre: 'Drama') }
  scope :scifi, -> { where(genre: 'Sci-fi') }
  scope :comedy, -> { where(genre: 'Comedy') }
end
