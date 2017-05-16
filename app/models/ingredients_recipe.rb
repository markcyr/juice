class IngredientsRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  belongs_to :unit

  # validates :quantity, numericality: { greater_than: 0}
#   # validates :quantity, numericality: { message: "%{value} needs to be a number" }
  validate :quantity_must_be_a_number

  def quantity_must_be_a_number
      errors.add(:base, "Quantity MUST be positive")
  end

end
