class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(self.user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])
    if !user.nil?
      user.update!(self.user_params)
      render json: user
    else
      render json: ["User does not exist"]
    end
  end

  def destroy
    user= User.find_by(id: params[:id])
    if !user.nil?
      user.destroy
      render json: user
    else
      render json: ["User does not exist"]
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
