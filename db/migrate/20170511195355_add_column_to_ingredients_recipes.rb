class AddColumnToIngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients_recipes, :unit_id, :integer
  end
end
