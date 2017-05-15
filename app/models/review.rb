class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
    max_paginates_per 5

  validates :rating, presence: true
end
