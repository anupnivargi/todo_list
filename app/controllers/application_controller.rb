class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  def authenticate
    redirect_to signin_path unless current_user
    true
  end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

end

