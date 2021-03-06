class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :location, presence: true
  validates :brand, presence: true
  validates :category, presence: true
  validates :seats, presence: true, inclusion: { in: (0..30) }
  validates :price_per_day, presence: true, numericality: { only_integer: true }, allow_blank: false

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
