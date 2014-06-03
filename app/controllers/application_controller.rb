class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :set_current_user

    def set_current_user
      User.current = current_user
    end

  rescue_from CanCan::AccessDenied do |exception|
 	  redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
    	#locations_path
      root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    #root_path
    new_user_session_path
  end
  
end
