class Admin::SessionsController < Admin::ApplicationController
  skip_before_filter :require_authentication, only: [:new, :create]
  def new
  end

  def create
    if params[:login].eql?(admin_login) && params[:password].eql?(admin_password)
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

  private

  def admin_login
    Settings.admin_login || ENV['ADMIN_LOGIN']
  end

  def admin_password
    Settings.admin_password || ENV['ADMIN_PASSWORD']
  end
end
