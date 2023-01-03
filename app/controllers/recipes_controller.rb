class RecipesController < ApplicationController
    before_action :authorize 

    def index 
        recipes = Recipe.all 
        render json: recipes, status: :created
    end

    def create 
        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def user
        User.find_by(id: session[:user_id]) 
    end

    def recipe_params 
        params.permit(:title, :instructions, :minutes_to_complete)
    end

end
