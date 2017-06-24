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




swapna = User.create(user_name: 'Swapna', email: 'swapna@gmail.com', password: 'password', password_confirmation: 'password')
paul = User.create(user_name: 'Paul', email: 'paul@gmail.com', password: 'password', password_confirmation: 'password')
azadeh = User.create(user_name: 'Azadeh', email: 'azadeh@gmail.com', password: 'password', password_confirmation: 'password')
mark = User.create(user_name: 'Mark', email: 'mark@gmail.com', password: 'password', password_confirmation: 'password')

Unit.create(unit_name: 'gr')
Unit.create(unit_name: 'oz')
Unit.create(unit_name: 'lb')
Unit.create(unit_name: 'cup')
Unit.create(unit_name: 'mL')



Recipe.create(name: 'AppleCarrotGinger',image: '5.jpg', user_id:1)
Recipe.create(name: 'BeetSpinach',image: '2.jpg', user_id:2)
Recipe.create(name: 'KaleCarrotApple',image: '3.jpg', user_id:3)
Recipe.create(name: 'CeleryCucumber',image: '1.jpg' ,user_id:4)



IngredientsRecipe.create(recipe_id:1, ingredient_id:30, quantity:30, unit_id:1)
IngredientsRecipe.create(recipe_id:1,  ingredient_id:2, quantity:30, unit_id:1)
IngredientsRecipe.create(recipe_id:1,  ingredient_id:66, quantity:30, unit_id:1)

IngredientsRecipe.create(recipe_id:2,  ingredient_id:17, quantity:30, unit_id:1)
IngredientsRecipe.create(recipe_id:2,  ingredient_id:151, quantity:30, unit_id:1)

IngredientsRecipe.create(recipe_id:3,  ingredient_id:74, quantity:30, unit_id:1)
IngredientsRecipe.create(recipe_id:3,  ingredient_id:30, quantity:30, unit_id:1)
IngredientsRecipe.create(recipe_id:3,  ingredient_id:3, quantity:30, unit_id:1)
IngredientsRecipe.create(recipe_id:3, ingredient_id:66, quantity:30, unit_id:1)

IngredientsRecipe.create(recipe_id:4,  ingredient_id:36, quantity:30, unit_id:2)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:54, quantity:30, unit_id:2)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:3, quantity:30, unit_id:2)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:66, quantity:30, unit_id:2)
IngredientsRecipe.create(recipe_id:4,  ingredient_id:82, quantity:30, unit_id:2)


Article.create(title:"Graduating From Fruit Juice to Vegetable Juice", image:"greenjuice.jpg", sentence:"Most people think immediately of fruit juice when you talk about making your own fresh juice at home.",text:"Most people think immediately of fruit juice when you talk about making your own fresh juice at home. While fresh fruit juice certainly is very healthy, you should also consider adding vegetable juice to your list of recipes. A lot of vegetables like carrot and celery actually taste quite sweet and refreshing, and are not all that different from fruit juices at all. A big benefit of vegetable juice over fruit is that there is less sugar, which can be a consideration if you drink a lot of juice. Even though it is fruit sugar (mainly fructose) it still has a relatively high GI. This becomes clear if you feed your young children several glasses of orange or apple juice! If you are new to vegetable juicing, it is best to start by just mixing a bit in with your regular juice. My own favourite combination is to mix Apples with celery and carrot, with a small amount of ginger root thrown in for a bit of a kick.", quote:" Let food be thy medicine and medicine be thy food. ~ Hippocrates")

Article.create(title:"Don't Buy Storebought Juice - Use a Juicer!", image:"jucier.jpg", sentence:"Like many other people,  I enjoy the taste of fruit juice.",text:"Like many other people,  I enjoy the taste of fruit juice. It is sweet and refreshing. And, because it is fruit, it is healthy for us...at least, that is what we would think. It is quite surprising to learn that buying fruit juice is not the best for your health. My favorite fruit juice is apple juice. I will have it in the morning and usually during dinner too. As they say, an apple a day keeps the doctor away. Unfortunately, that is not the case with apple juice, as the clear apple liquid found in grocery stores has been heavily processed and is completely devoid of most nutrients. It does include 100% vitamin C, but not much else. The problem is that the nutrients, vitamins and enzymes found in raw apples do not last long when mass producing apple juice for grocery stores. Some nutrients will be killed off simply by being exposed to the air too long - this is known as oxidation. If you cut an apple open and watch it turn brown, that is what oxidation is. Next, most of the remaining nutrients will be destroyed from all the heat and violent processes that go into creating apple juice.", quote:"A fit, healthy body—that is the best fashion statement. ~ Jess C. Scott")

Article.create(title:"Juicing For Your Kids Health", image:"child.jpg", sentence:"How hard is it to get your kids to eat their veggies?  Unfortunately for many, it is quite tough",text:"How hard is it to get your kids to eat their veggies?  Unfortunately for many, it is quite tough.  Kids these days won't even look at a vegetable unless it is deep fried and comes with a toy.  With juicing, your kids will be running to you to eat their veggies. The advantage to juicing for kids is that it is simple.  It takes very little effort on your part to create, and it takes little effort on their part to drink the juice.  The key here is to make them taste good.  Unfortunately, while it would be great if they would drink a glass of spinach and celery juice right away, you are going to need to ease them into the rich vegetable juicing recipes.
How do you get your kids to like the juice?  That's easy...make it sweet!  This should never be interpreted as  "" adding sugar.""  The idea is to juice sweet produce to make them appealing to your kids taste, while also adding a little vegetables.  For example, most kids love apple juice and orange juice.  Try juicing a few apples and oranges, but also include a little celery or cucumber juice.  If done right, they won't even notice the taste of anything but the fruit.  Of course, you don't want them to only drink fruit juice because of all the sugar.  Gradually increase the amount of vegetable juice as they get used to it.  Eventually, you can add in some of the richer green vegetables like spinach.  Before you know it, they'll be getting most of their nutrients from juicing.Article ", quote:"Cakes are healthy too, you just eat a small slice.  ~Mary Berry")

Article.create(title:"Better Your Diet With Vegetable Juicing Recipes!", image:"juice2.jpg", sentence:"Raw vegetables have the most nutritional value. The amount of nutrients in vegetables decreases in cooking them over time.",text:"Raw vegetables have the most nutritional value. The amount of nutrients in vegetables decreases in cooking them over time. But eating raw vegetables all the time is bland. Some don't like the taste of certain produce unless cooked a specific way. With juicing, you get all the nutrients of your veggies in one easy drink. Juicing your vegetables is really easy and fast. Collect some vegetables, throw them in the juicer, and that is it. No time wasted on having to prepare your vegetables the right way - and you get more phytonutrients than if you had done so. Mix together as many different vegetables as you want too and enjoy each of their health benefits. If you don't like the taste, mix in fruits that you love the taste of to add nutrients and deliciousness to all your juicing recipes! Can't you just buy vegetable juice at the supermarket? Why start vegetable juicing? Well, you could buy commercial vegetable juice, but when compared to your own fresh juicing recipes, they are seriously stripped of nutritional content. Many enzymes in vegetable juice are fragile, and will die off not long after juicing the vegetable. Commercial vegetable juice will undergo processes that will further reduce the nutritional value. And we should not forget all the additional unhealthy ingredients that they pack in there as well.", quote:"Eat healthily, sleep well, breathe deeply, move harmoniously.  ~ Jean-Pierre Barral")

Article.create(title:"Healthy Juices", image:"juice4.jpg", sentence:"Apple Juice- While it tastes great , you won't get as many nutrients from it as a whole apple or from other juices",text:"Apple Juice- While it tastes great , you won't get as many nutrients from it as a whole apple or from other juices. On the other hand it does have polyphenols antioxidants shown to fight cancer, potassium and iron. It contains about 117 calories in an 8-oz serving. Cranberry Juice-With 116 calories per 8-oz serving, cranberry juice boasts heart healthy flavonoids, vitamin C and antibacterial properties. However, cranberries are naturally tart, so most juices contain added sugar-consider the 'no added sugar' variety to avoid the extra calories.Orange Juice- With the obvious benefits of vitamin C, orange juice also contains doses of potassium and folate. Fortified orange juice comes with added calcium, vitamin D and heart healthy omega-3's. It contains about 110 calories in an 8-oz serving. Ounce for ounce it does contain more nutrition than most other juices but watch your portions! Tomato Juice-With only 53 calories per 8-oz serving and beneficial amounts of potassium, lycopene, vitamin C and beta-carotene, it is tempting to drink it (and/or V-8) as a substitute for eating vegetables. But tomato juice and tomato juice blends (like V-8) tend to be high in sodium. Look for the low-sodium version with less than 480 mg per serving.While it is great to drink heart healthy juices, nothing substitutes the healthiest beverage on earth: Water. Drink a variety of juices and other beverages in addition to drinking water as a way to add variety and get more vitamins and nutrients, but be careful not to decrease the amount of vegetables in your diet.", quote:"No disease that can be treated by diet should be treated with any other means. ~ Maimonides")

Article.create(title:"Juicing For Good Health", image:"juice3.jpg", sentence:"Here's the fastest, easiest way to make sure you get your recommended five servings of fruit and vegetables a day.",text:"Here's the fastest, easiest way to make sure you get your recommended five servings of fruit and vegetables a day. Fresh fruit and raw vegetable juices are nature's best rejuvenators.The simplest way to get a dose of skin-boosting nutrients is with juicing. Some experts in longevity believe that the path to agelessness, not to mention maximum life span, is through the consumption of ""live"" foods and the supplementation of raw vegetables and fruit juices. Juicing fans also swear that fasting this way swiftly purifies the body, ridding it of potentially harmful build-up of toxins.Juices are an easy and delicious way to make sure we are getting our quota of fruit and vegetables each day, which can be hard to achieve otherwise. Few of us would eat five carrots, but we could easily drink a 16-ounce glass of carrot juice, which is the equivalent. Taken with meals, the enzymes in fresh juice help us digest our foods. Juices are also great meal substitutes when you are in a hurry and need a fast blast of nutrients.", quote:"It is easier to change a man's religion than to change his diet. ~ Margaret Mead")
