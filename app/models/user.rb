class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :reviews
  has_many :reviewed_recipes, class_name: "Recipe", through: :reviews

  has_many :recipes


end
