class IngredientsController < ApplicationController


  def index
    @ingredients = Ingredient.all
    @search = Ingredient.search(params[:q])
    @ingredients = @search.result
  end

 def show
      @ingredient = Ingredient.find(params[:id])
  # <%= ingredient.select :unit, ingredient.measure%>
# <%= ingredient.collection_select(:ingredient_id, @ingredient.measure, :id, :measure ) %>
# <%= ingredient.select(:ingredient, :ingredient.measure)
 end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_parms)

    if @ingredient.save
      redirect_to ingredient_url
    else
      render :new
    end
  end

private

  def ingredient_params

    params.require(:ingredient).permit(:name, :unit, :image, :water_g, :energ_kcal, :protein_g, :lipid_tot_g, :ash_g, :carbohydrt_g, :fiber_td_g, :sugar_tot_g, :calcium_mg, :iron_mg, :magnesium_mg, :phosphorus_mg, :potassium_mg, :sodium_mg, :zinc_mg, :copper_mg, :manganese_mg, :selenium_ug, :vit_c_mg, :thiamin_mg, :riboflavin_mg, :niacin_mg, :panto_acid_mg, :vit_b6_mg, :folate_tot_ug, :folic_acid_ug, :food_folate_ug, :folate_dfe_ug, :choline_tot_mg, :vit_b12_ug, :vit_a_iu, :vit_a_rae, :retinol_ug, :alpha_carot_ug, :beta_carot_ug, :beta_crypt_ug, :lycopene_ug, :lut_zea_ug, :vit_e_mg, :vit_d_ug, :vit_d_iu, :vit_k_ug, :fa_sat_g, :fa_mono_g, :fa_poly_g, :gmwt_1, :gmwt_desc1, :gmwt_2, :gmwt_desc2, :gmwt_3, :gmwt_desc3, :gmwt_4, :gmwt_desc4)
  end

end
