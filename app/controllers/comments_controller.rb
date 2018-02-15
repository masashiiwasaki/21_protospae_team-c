class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text:comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id)
    # redirect_to "/prototypes/#{@comment.prototype.id}"
    respond_to do |format|
      format.json
      # format.html { redirect_to prototype_path[:prototype_id] }

    end
  end

  private
  def comment_params
    params.permit(:text, :prototype_id)
  end
end
