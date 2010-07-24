class UserSessionsController < ApplicationController

  before_filter :require_user, :only => [:destroy, :index, :show]

  protect_from_forgery :only => [:destroy]


  def index
    destroy
  end

  def show
    log_me_out
  end

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end


  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end

  def log_me_out
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to login_url
  end

end
