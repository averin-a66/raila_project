class IngrsController < ApplicationController
  def create
    # render plain: params[:ingr].inspect
    @recipe = Recipe.find(params[:recipe_id])
    @ingr = @recipe.ingrs.create(ingredient_params)
    redirect_to edit_recipe_path(@recipe)
  end

  private
  def ingredient_params
    params.require(:ingr).permit(  :name_in, :amount_in, :enum_id)
  end
end
