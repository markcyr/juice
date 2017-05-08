class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.string :image
      t.float  :water_g
      t.float  :energ_kcal
      t.float  :protein_g
      t.float  :lipid_tot_g
      t.float  :ash_g
      t.float  :carbohydrt_g
      t.float  :fiber_td_g
      t.float  :sugar_tot_g
      t.float  :calcium_mg
      t.float  :iron_mg
      t.float  :magnesium_mg
      t.float  :phosphorus_mg
      t.float  :potassium_mg
      t.float  :sodium_mg
      t.float  :zinc_mg
      t.float  :copper_mg
      t.float  :manganese_mg
      t.float  :selenium_ug
      t.float  :vit_c_mg
      t.float  :thiamin_mg
      t.float  :riboflavin_mg
      t.float  :niacin_mg
      t.float  :panto_acid_mg
      t.float  :vit_b6_mg
      t.float  :folate_tot_ug
      t.float  :folic_acid_ug
      t.float  :food_folate_ug
      t.float  :folate_dfe_ug
      t.float  :choline_tot_mg
      t.float  :vit_b12_ug
      t.float  :vit_a_iu
      t.float  :vit_a_rae
      t.float  :retinol_ug
      t.float  :alpha_carot_ug
      t.float  :beta_carot_ug
      t.float  :beta_crypt_ug
      t.float  :lycopene_ug
      t.float  :lut_zea_ug
      t.float  :vit_e_mg
      t.float  :vit_d_ug
      t.float  :vit_d_iu
      t.float  :vit_k_ug
      t.float  :fa_sat_g
      t.float  :fa_mono_g
      t.float  :fa_poly_g
      t.string :gmwt_1
      t.string :gmwt_desc1
      t.string :gmwt_2
      t.string :gmwt_desc2
      t.string :gmwt_3
      t.string :gmwt_desc3
      t.string :gmwt_4
      t.string :gmwt_desc4


      t.timestamps
    end
  end
end
