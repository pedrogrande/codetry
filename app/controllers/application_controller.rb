class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  before_filter :banned?

  def banned?
    if current_user.present? && current_user.ban?
      sign_out current_user
      flash[:error] = "This account has been suspended...."
      root_path
    end
  end

end
