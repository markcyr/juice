class Recipe < ApplicationRecord
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :reviews
  has_many :users, through: :reviews

  belongs_to :user
  accepts_nested_attributes_for :ingredients_recipes, allow_destroy: true, reject_if: :all_blank

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
      # size returns the total amount grams of the juice
      size += (q*g)
      # v is the amount of nutrient per 100 gram of an ingredient
      if (ingredient_recipe.ingredient.send("#{nutrients[nutrient.to_sym]}") == nil)
        v = 0
      else
        v = ingredient_recipe.ingredient.send("#{nutrients[nutrient.to_sym]}")
      end
      ingredient_nutrient << (q*g)*(v/100.0)
    end
    total_per_serving =  (ingredient_nutrient.sum)/(size/125.0)

    return total_per_serving.round(2)
  end

  def daily_value(nutrient)
    # recommended daily intake of nutrients is stored in rdi
    rdi = {iron: 14, calcium: 1100, fat: 65, vitC: 60, vitA: 1000, sodium: 2400, carbohydrate: 300, fiber: 25}
    serving_amount = self.get_nutrient(nutrient)
    nutrient_rdi = rdi[nutrient.to_sym]
    davily_value = (serving_amount / nutrient_rdi) * 100
    return davily_value.round(2)
  end

  def generate_name
    adjective = ["Abundant", "Adorable", "Adventurous","Alluring", "Amazing", "Ambitious", "Amusing" ,"Aromatic", "Astonishing", "Attractive", "Awesome", "Beautiful", "Bizarre", "Blushing", "Brainy", "Brave", "Breezy", "Bright", "Bustling", "Classy", "Classic", "Crafted","Delectable","Delightful", "Extraordinary", "Flavourful", "Generous", "Gorgeous", "Heavenly", "Intense", "Juicy","Intriguing", "Lavish", "Lean", "Lip-smacking", "Lively", "Luscious", "Perfect", "Popular", "Rich", "Skillful", "Smooth", "Soothing", "Special", "Superb", "Tasteful", "Tasty", "Terrific", "Chilled", "Cool", "Delicious", "Fresh", "Fantastic", "Famous", "Happy", "Nutritious"]

    characters = ["Monster", "Diva", "King", "Princess", "Prince", "Queen", "Giant", "Fighter", "Wizard", "Hero", "Heroine", "Explorer", "Rebel", "Ruler", "Boss", "God", "Goddess", "Challenger", "Warrior", "Badboy", "Contender", "Cat-lady", "Bad-girl", "Drama-Queen", "Southern Belle", "Soulmate", "Ninja", "Knight", "Droid", "Hacker", "Robot", "Drag-Queen"]

    self.name = adjective.sample + " " + ingredients.sample.name.titlecase + " " + characters.sample

    self.save
  end

end
