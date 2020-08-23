class Review < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :score, presence: true
  attachment :review_image



end
