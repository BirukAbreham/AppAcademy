class CommentsController < ApplicationController

  def index
    if !params[:user_id].nil?
      user = User.find_by(id: params[:user_id])
      if !user.nil?
        render json: user.comments
      end
    end

    if !params[:id].nil?
      artwork = Artwork.find_by(id: params[:id])
      if !artwork.nil?
        render json: artwork.comments
      end
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :artowrk_id)
  end

end
