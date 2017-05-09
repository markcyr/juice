# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170509175308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "image"
    t.float "water_g"
    t.float "energ_kcal"
    t.float "protein_g"
    t.float "lipid_tot_g"
    t.float "ash_g"
    t.float "carbohydrt_g"
    t.float "fiber_td_g"
    t.float "sugar_tot_g"
    t.float "calcium_mg"
    t.float "iron_mg"
    t.float "magnesium_mg"
    t.float "phosphorus_mg"
    t.float "potassium_mg"
    t.float "sodium_mg"
    t.float "zinc_mg"
    t.float "copper_mg"
    t.float "manganese_mg"
    t.float "selenium_ug"
    t.float "vit_c_mg"
    t.float "thiamin_mg"
    t.float "riboflavin_mg"
    t.float "niacin_mg"
    t.float "panto_acid_mg"
    t.float "vit_b6_mg"
    t.float "folate_tot_ug"
    t.float "folic_acid_ug"
    t.float "food_folate_ug"
    t.float "folate_dfe_ug"
    t.float "choline_tot_mg"
    t.float "vit_b12_ug"
    t.float "vit_a_iu"
    t.float "vit_a_rae"
    t.float "retinol_ug"
    t.float "alpha_carot_ug"
    t.float "beta_carot_ug"
    t.float "beta_crypt_ug"
    t.float "lycopene_ug"
    t.float "lut_zea_ug"
    t.float "vit_e_mg"
    t.float "vit_d_ug"
    t.float "vit_d_iu"
    t.float "vit_k_ug"
    t.float "fa_sat_g"
    t.float "fa_mono_g"
    t.float "fa_poly_g"
    t.string "gmwt_1"
    t.string "gmwt_desc1"
    t.string "gmwt_2"
    t.string "gmwt_desc2"
    t.string "gmwt_3"
    t.string "gmwt_desc3"
    t.string "gmwt_4"
    t.string "gmwt_desc4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipes", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "comment"
    t.integer "user_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
  end

end
