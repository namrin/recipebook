class RecipesController < ApplicationController
	before_action :authenticate_user!
	before_action :get_recipe, only: [:show, :edit, :update, :destroy]

	def index 
		@recipes = current_user.recipes.all 
	end
	def show
	end
	def new
		@recipe = current_user.recipes.new
	end
	def create
		@recipe = current_user.recipes.new(recipe_params)
		if @recipe.save
      		redirect_to user_recipe_path(current_user, @recipe)
    	else
    		render :new
    	end
	end
	def edit		
	end
	def update
		if @recipe.update(recipe_params)
      		redirect_to user_recipe_path(current_user, @recipe)
    	else
    		render :edit
    	end
	end
	def destroy
		@recipe.destroy
		redirect_to user_recipes_path(current_user)
	end
	private
		def get_recipe
			@recipe = current_user.recipes.find(params[:id])
		end
		def recipe_params
			params.require(:recipe).permit(:name,:author,:ingredients,:directions,:category,:reference,:image,:note)
		end
end
