require 'date'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vans
  has_many :bookings
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

  validate :email_format
  validate :of_age

  def of_age
    errors.add(:date_of_birth, 'You should be over 18 years old.') if date_of_birth.present? && date_of_birth > 18.years.ago.to_date
  end

  def email_format
    errors.add(:email, 'Not a valid email address') unless email =~ /\A.+@.+\.[a-zA-Z]+/
  end
end
