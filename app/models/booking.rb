require 'date'

class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user

  validates :checkin, presence: true
  validates :checkout, presence: true
  validate :dates_cannot_be_in_the_past
  validate :checkin_before_checkout

  def dates_cannot_be_in_the_past
    errors.add(:checkin, "Sorry, can't be in the past") if checkin < Date.today
    errors.add(:checkout, "Sorry, can't be in the past") if checkout < Date.today
  end

  def checkin_before_checkout
    errors.add(:checkout, "Sorry, check-out can't be before check-in.") if checkout < checkin
  end

  # def checkin_cannot_be_in_the_past
  #   puts "Running method..."
  #   errors.add(:checkin, "can't be in past") if checkin < Date.today
  # end
end
