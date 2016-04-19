class ChangeInstructionsToText < ActiveRecord::Migration
  def change
    change_column :recipes, :ingredients, :text
  end
end
