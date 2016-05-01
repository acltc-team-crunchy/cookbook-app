class CreateCategorizedRecipes < ActiveRecord::Migration
  def change
    create_table :categorized_recipes do |t|
      t.integer :category_id
      t.integer :recipe_id

      t.timestamps null: true
    end
  end
end
