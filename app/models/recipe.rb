class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :categorized_recipes
  has_many :categories, through: :categorized_recipes

  validates :title, :directions, :prep_time, presence: true
  validates :prep_time, numericality: {only_integer: true}

  def ingredients_split
    ingredients.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end

  def friendly_prep_time
    minutes = prep_time / 60
    seconds = prep_time % 60
    p minutes
    p seconds
    result = ""
    result += "#{minutes} minutes" if minutes > 0
    result += "#{seconds} seconds"  if seconds > 0
    result
  end

end
