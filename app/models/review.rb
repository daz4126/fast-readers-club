class Review < ApplicationRecord
  validates :title, presence: true
  validates :review, presence: true
  validates :rating, presence: true, numericality: { in: 1..5 }
  belongs_to :book
  belongs_to :user
end
