# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'INGREDIENTS.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Ingredient.new
  t.name = row['name']
  t.unit = row['unit']
  t.image = row['image']
  t.water_g = row['water_g']
  t.energ_kcal = row['energ_kcal']
  t.protein_g = row['protein_g']
  t.lipid_tot_g = row['lipid_tot_g']
  t.ash_g = row['ash_g']
  t.carbohydrt_g = row['carbohydrt_g']
  t.fiber_td_g = row['fiber_td_g']
  t.sugar_tot_g = row['sugar_tot_g']
  t.calcium_mg = row['calcium_mg']
  t.iron_mg = row['iron_mg']
  t.magnesium_mg = row['magnesium_mg']
  t.phosphorus_mg = row['phosphorus_mg']
  t.potassium_mg = row['potassium_mg']
  t.sodium_mg = row['sodium_mg']
  t.zinc_mg = row['zinc_mg']
  t.copper_mg = row['copper_mg']
  t.manganese_mg = row['manganese_mg']
  t.selenium_ug = row['selenium_ug']
  t.vit_c_mg = row['vit_c_mg']
  t.thiamin_mg = row['thiamin_mg']
  t.riboflavin_mg = row['riboflavin_mg']
  t.niacin_mg = row['niacin_mg']
  t.panto_acid_mg = row['panto_acid_mg']
  t.vit_b6_mg = row['vit_b6_mg']
  t.folate_tot_ug = row['folate_tot_ug']
  t.folic_acid_ug = row['folic_acid_ug']
  t.food_folate_ug = row['food_folate_ug']
  t.folate_dfe_ug = row['folate_dfe_ug']
  t.choline_tot_mg = row['choline_tot_mg']
  t.vit_b12_ug = row['vit_b12_ug']
  t.vit_a_iu = row['vit_a_iu']
  t.vit_a_rae = row['vit_a_rae']
  t.retinol_ug = row['retinol_ug']
  t.alpha_carot_ug = row['alpha_carot_ug']
  t.beta_carot_ug = row['beta_carot_ug']
  t.beta_crypt_ug = row['beta_crypt_ug']
  t.lycopene_ug = row['lycopene_ug']
  t.lut_zea_ug = row['lut_zea_ug']
  t.vit_e_mg = row['vit_e_mg']
  t.vit_d_ug = row['vit_d_ug']
  t.vit_d_iu = row['vit_d_iu']
  t.vit_k_ug = row['vit_k_ug']
  t.fa_sat_g = row['fa_sat_g']
  t.fa_mono_g = row['fa_mono_g']
  t.fa_poly_g = row['fa_poly_g']
  t.gmwt_1 = row['gmwt_1']
  t.gmwt_desc1 = row['gmwt_desc1']
  t.gmwt_2 = row['gmwt_2']
  t.gmwt_desc2 = row['gmwt_desc2']
  t.gmwt_3 = row['gmwt_3']
  t.gmwt_desc3 = row['gmwt_desc3']
  t.gmwt_4 = row['gmwt_4']
  t.gmwt_desc4 = row['gmwt_desc4']
  t.save

  puts "#{t.name}, #{t.gmwt_desc1} saved"
end




swapna = User.create(user_name: 'Swapna', email: 'swapna@gmail.com', crypted_password: 'password')
paul = User.create(user_name: 'Paul', email: 'paul@gmail.com', crypted_password: 'password')
azadeh = User.create(user_name: 'Azadeh', email: 'azadeh@gmail.com', crypted_password: 'password')
mark = User.create(user_name: 'Mark', email: 'mark@gmail.com', crypted_password: 'password')




Recipe.create(name: 'AppleCarrotGinger', user:swapna)
Recipe.create(name: 'BeetSpinach', user:paul)
Recipe.create(name: 'KaleCarrotAppleGinger', user:azadeh)
Recipe.create(name: 'CeleryCucumberAppleGingerLemon' ,user:mark)



IngredientsRecipe.create(recipe_id:1, ingredient_id:30, quantity:30)
IngredientsRecipe.create(recipe_id:1,  ingredient_id:2, quantity:30)
IngredientsRecipe.create(recipe_id:1,  ingredient_id:66, quantity:30)

IngredientsRecipe.create(recipe_id:2,  ingredient_id:17, quantity:30)
IngredientsRecipe.create(recipe_id:2,  ingredient_id:151, quantity:30)

IngredientsRecipe.create(recipe_id:3,  ingredient_id:74, quantity:30)
IngredientsRecipe.create(recipe_id:3,  ingredient_id:30, quantity:30)
IngredientsRecipe.create(recipe_id:3,  ingredient_id:3, quantity:30)
IngredientsRecipe.create(recipe_id:3, ingredient_id:66, quantity:30)

IngredientsRecipe.create(recipe_id:4,  ingredient_id:36, quantity:30)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:54, quantity:30)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:3, quantity:30)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:66, quantity:30)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:82, quantity:30)
