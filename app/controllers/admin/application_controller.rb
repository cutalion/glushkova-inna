class Admin::ApplicationController < ::ApplicationController
  layout 'admin'
  before_filter :require_authentication

  protected

  def require_authentication
     redirect_to admin_login_path unless user_logged_in?
  end

  def user_logged_in?
    session[:user_logged_in]
  end
  helper_method :user_logged_in?
end
