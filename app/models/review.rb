class Review < ApplicationRecord
  belongs_to :van
  belongs_to :user
  validates :content, length: { minimum: 4 }
end
