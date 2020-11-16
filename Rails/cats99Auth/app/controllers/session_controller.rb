class SessionController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]
  
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:username], params[:password])

    if user.nil?
      flash[:notices] ||= []
      flash[:notices] << "Username/password combination was bad"

      render :new
      return
    else
      # generate a 16-digit random token
      login_user!(user)
      redirect_to '/cats'
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
