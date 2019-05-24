class Review < ApplicationRecord
  belongs_to :van
  validates :content, length: { minimum: 10 }
end
