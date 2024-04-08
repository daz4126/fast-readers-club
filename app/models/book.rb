class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :cover, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  has_many :reviews, dependent: :destroy
end
