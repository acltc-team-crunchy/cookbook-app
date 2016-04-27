class AddUserIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :user_id, :integer
    remove_column :recipes, :chef, :string
  end
end
