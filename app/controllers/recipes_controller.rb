class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    
  end

  def create
    new_recipe = Recipe.new(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions], prep_time: params[:prep_time])
    puts "down there"
    p new_recipe
    new_recipe.save
    redirect_to "/recipes/#{new_recipe.id}"
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update

    #First Way
    # @recipe = Recipe.find_by(id: params[:id])
    # @recipe.assign_attributes(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions], prep_time: params[:prep_time])
    # @recipe.save

    #Second Way
    # @recipe = Recipe.find_by(id: params[:id])
    # @recipe.title = params[:title]
    # @recipe.chef = params[:chef]
    # @recipe.ingredients = params[:ingredients]
    # @recipe.directions = params[:directions]
    # @recipe.prep_time = params[:prep_time]
    # @recipe.save

    #Third Way
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions], prep_time: params[:prep_time])
    flash[:success] = "Recipe Updated"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to "/recipes"
  end

end
