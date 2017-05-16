class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image
      t.string :sentence
      t.text :text
      t.string :quote

      t.timestamps
    end
  end
end
