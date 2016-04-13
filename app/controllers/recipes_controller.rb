class RecipesController < ApplicationController

  def first_recipe
    @first_recipe = Recipe.last
  end

end
