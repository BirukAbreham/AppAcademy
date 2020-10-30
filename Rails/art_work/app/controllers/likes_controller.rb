class LikesController < ApplicationController

  def index
    begin
      user = User.find(params[:user_id])
      render json: user.liked
    rescue => exception
      render json: [ 'user does not exist' ]
    end
  end

  def art_liked_by
    begin
      artwork = Artwork.find(params[:id])
      render json: artwork.users_liked
    rescue => exception
      render json: [ 'artwork does not exist' ]
    end
  end

  def comment_liked_by
    begin
      comment = Comment.find(params[:id])
      render json: comment.users_liked
    rescue => exception
      render json: [ 'comment does not exist' ]
    end
  end

end
