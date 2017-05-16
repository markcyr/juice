class Recipe < ApplicationRecord
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :reviews
  has_many :users, through: :reviews

  belongs_to :user
  accepts_nested_attributes_for :ingredients_recipes

# get_nutrient method calculates the amount of a nutrient per serving size
  def get_nutrient(nutrient)
    nutrients = {protein: 'protein_g', iron: 'iron_mg', calcium: 'calcium_mg', calory: 'energ_kcal', fat: 'lipid_tot_g',
       vitC: 'vit_c_mg', vitA: 'vit_a_rae', sodium: 'sodium_mg', sugar: 'sugar_tot_g',
       carbohydrate: 'carbohydrt_g', fiber: 'fiber_td_g', saturated_fat: 'fa_sat_g'  }
      #  serving size for juice is 125 mL
    serving_size = 125
      #  total volume of the juice considering the water density for the juice
    size = 0
    joint_record = self.ingredients_recipes
    ingredient_nutrient = []
    joint_record.each do |ingredient_recipe|
      q = ingredient_recipe.quantity
      u = ingredient_recipe.unit.unit_name
      case u
        when "gr"
          g = 1
        when "cup"
          g = 250
        when "oz"
          g = 29.58
        when "lb"
          g = 454
      end
      size += (q*g)
      # v is the amount of nutrient per 100 gram of an ingredient
      v = ingredient_recipe.ingredient.send("#{nutrients[nutrient.to_sym]}")
      ingredient_nutrient << (q*g)*(v/100.0)
    end
    total_per_serving =  (ingredient_nutrient.sum)/(size/125.0)

    return total_per_serving.round(2)
  end

  def daily_value(nutrient)
    # recommended daily intake of nutrients is stored in rdi
    rdi = {iron: 14, calcium: 1100, fat: 65,vitC: 60, vitA: 1000, sodium: 2400, carbohydrate: 300, fiber: 25}
    serving_amount = self.get_nutrient(nutrient)
    nutrient_rdi = rdi[nutrient.to_sym]
    davily_value = (serving_amount / nutrient_rdi) * 100
    return davily_value.round(2)
  end


end
