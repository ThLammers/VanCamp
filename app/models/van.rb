class Van < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :brand, presence: true
  validates :category, presence: true
  validates :seats, presence: true, inclusion: { in: (0..30) }
end
