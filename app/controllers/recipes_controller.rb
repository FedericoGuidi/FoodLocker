class RecipesController < ApplicationController
    
    def index
        @recipes=Recipe.paginate(page: params[:page])
    end
    
    def new
        @recipe=Recipe.new
    end
    
    def show
        @recipe=Recipe.find(params[:id])
    end
    
    def search
        searchword = params[:search]
        kcal_max=params[:kcal_max]
        if kcal_max.blank?
            @data = Recipe.where("((ingredients LIKE ?) or (title LIKE ?))","%#{searchword}%","%#{searchword}%")
        else
            @data = Recipe.where("((ingredients LIKE ?) or (title LIKE ?)) and kcal < ?","%#{searchword}%","%#{searchword}%","#{kcal_max}")
        end
    end
    
    def create
        @recipe=current_user.recipes.build(recipe_params)
        if @recipe.save
            flash[:success]= "#{@recipe.title} inserted!"
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    def destroy
        Recipe.find(params[:id]).destroy
        flash[:success]="Recipe deleted"
        redirect_to recipes_url
    end
    
    private
    
        def recipe_params
            params.require(:recipe).permit(:photo, :title, :kcal, :ingredients, :directions)
        end
end
