class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, :comment, presence: true

end
