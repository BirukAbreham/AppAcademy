class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]
  
  def new
    @user = User.new
    render template: 'users/new'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      redirect_to '/cats'
    else
      render template: 'users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
