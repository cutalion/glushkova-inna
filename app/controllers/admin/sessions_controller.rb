class Admin::SessionsController < Admin::ApplicationController
  skip_before_filter :require_authentication, only: [:new, :create]
  def new
  end

  def create
    if params[:login].eql?(ENV['ADMIN_LOGIN']) && params[:password].eql?(ENV['ADMIN_PASSWORD'])
      session[:user_logged_in] = true
      redirect_to admin_albums_path
    else
      flash.now[:alert] = "Invalid login or password"
      render :new
    end
  end

  def destroy
    session[:user_logged_in] = false
    redirect_to admin_login_path
  end
end
