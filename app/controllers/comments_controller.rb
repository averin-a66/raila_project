class CommentsController < ApplicationController
  def create
    #render plain: params[:comment].inspect
     @recipe=Recipe.find(params[:recipe_id])
    #render plain: @recipe.inspect
     @comment=@recipe.comments.create(comment_params)
     redirect_to recipe_path(@recipe)
  end

  private def comment_params
    params.require(:comment).permit(:user_id, :body, :com_data)
  end
end
