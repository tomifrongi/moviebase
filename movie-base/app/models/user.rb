# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  birth_date    :date
#  document      :string
#  document_type :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class User < ApplicationRecord
  validates :name, :birth_date, :document_type, :document, presence: true
  validate :validate_age
  validate :validate_document

  def validate_age
    return unless birth_date > 18.years.ago.to_date

    errors.add(:birth_date, 'The user must be 18 years old or older')
  end

  def validate_document
    return unless document_type == 'cedula'

    errors.add(:document, 'Invalid format for document type "cedula"') unless valid_document?
  end

  def valid_document?
    cedula = document.gsub(/[^\d]/, '')

    return false unless cedula.length == 8
    return false unless cedula =~ /^\d+$/

    total = 0
    factors = [2, 9, 8, 7, 6, 3, 4]
    (0..6).each do |i|
      total += cedula[i].to_i * factors[i]
    end
    rest = total % 10
    verification_digit = rest == 0 ? 0 : 10 - rest

    verification_digit == cedula[7].to_i
  end
end
