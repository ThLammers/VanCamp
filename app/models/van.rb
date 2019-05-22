class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :location, presence: true
  validates :brand, presence: true
  validates :category, presence: true
  validates :seats, presence: true, inclusion: { in: (0..30) }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
