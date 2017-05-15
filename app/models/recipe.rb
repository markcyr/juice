class Recipe < ApplicationRecord
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :reviews
  has_many :users, through: :reviews

  belongs_to :user
  accepts_nested_attributes_for :ingredients_recipes


  def get_nutrient(nutr)
    nutrients = {protein: 'protein_g', iron: 'iron_mg', calcium: 'calcium_mg', calory: 'energy_kcal', fat: 'lipid_tot_g',
       vitC: 'vit_c_mg', VitA: 'vit_a_rae', sodium: 'sodium_mg', sugar: 'sugar_tot_g', carbohydrate: 'carbohydrt_g', fiber: 'fiber_td_g'  }
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
      v = ingredient_recipe.ingredient.send("#{nutrients[nutr.to_sym]}")
      ingredient_nutrient << (q*g)*(v/100.0)
    end
    
      total_per_serving =  (ingredient_nutrient.sum)/(size/125.0)
    return total_per_serving.round(2)
  end



end
