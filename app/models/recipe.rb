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
    joint_record = self.ingredients_recipes

    # nutrients.each do |key, value|
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
        v = ingredient_recipe.ingredient.send("#{nutrients[nutr.to_sym]}")
        ingredient_nutrient << ((q*g)*(v/100)).round(2)
      end
      total = ingredient_nutrient.sum
    return total
  end

  def calcium

    calcium_array = []
    joint_record = self.ingredients_recipes
    joint_record.each do |ingredient_recipe|
    q = ingredient_recipe.quantity
    v = ingredient_recipe.ingredient.calcium_mg
    calcium_array << q*(v/100).round(2)
    # calcium is in units of mg
    end
    return calcium_array.sum


  end

end




# <% @recipe.ingredients_recipes.each do |ingredient_recipe| %>
# Name:<%= ingredient_recipe.ingredient.name %> ,
# <%= ingredient_recipe.quantity %><br>
# Water: <%= ingredient_recipe.ingredient.water_g %>gms<br>
