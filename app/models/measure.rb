class Measure < ApplicationRecord
  belongs_to :user

  validates :weight, :cincture, presence: true
  validates :weight, numericality: true
  validates :cincture, numericality: { only_integer: true }
end
