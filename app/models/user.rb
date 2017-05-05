class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :reviews
  has_many :recipes, through: :reviews

  has_many :owned_recipes, class_name: "Recipe", foreign_key: "user_id"


end
