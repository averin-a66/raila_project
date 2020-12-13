class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes=Recipe.all
  end
  def new
    @recipe=Recipe.new
  end
  def create
    #№render plain: params[:recipe].inspect
    @recipe=Recipe.new(rec_params);

    if (@recipe.save)
    redirect_to @recipe
    else
        render 'new'
      end
  end

  private def rec_params
    #render plain: params[:post].inspect
    params.require(:recipe).permit(:name, :body, :user_id)

  end

  def show
    @recipe=Recipe.find(params[:id])



  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if(@recipe.update(rec_params))
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end


end
