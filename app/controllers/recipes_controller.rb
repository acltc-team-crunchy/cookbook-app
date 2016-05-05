class RecipesController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  def index
    if params[:sort]
      @recipes = Recipe.order(sort_choice)
    elsif params[:category]
        @recipes = Category.find_by(name: params[:category]).recipes
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(title: params[:title], ingredients: params[:ingredients], directions: params[:directions], prep_time: params[:prep_time], user_id: current_user.id)
    if @recipe.save #happy path :)
      flash[:success] = "Recipe Created!"
      redirect_to "/recipes/#{@recipe.id}"
    else #sad path :(
      render :new
    end
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
    @recipe.update(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions], prep_time: params[:prep_time], image: params[:image])
    flash[:success] = "Recipe Updated"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to "/recipes"
    flash[:warning] = "Recipe Updated"
  end

end
