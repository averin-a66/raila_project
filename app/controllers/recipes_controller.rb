class RecipesController < ApplicationController
  def index
    @recipe=Recipe.all
  end
  def new
    @recipe=Recipe.new
  end
  def create
    @recipe=Recipe.new(rec_params)
    if (@recipe.save)
    redirect_to @recipe
    else
      render 'new'
      end
  end
  private def rec_params
    params.require(:recipe).permit(:name, :body, :user)
  end
  def show
    @recipe=Recipe.find(params[:id])
  end
end
