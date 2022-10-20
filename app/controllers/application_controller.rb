class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_new_params, if: :devise_controller?

  protected 
    def configure_new_params
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :contact, :email, :password, :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :contact, :email, :password, :current_password)}
    end

    def after_sign_in_path_for(resource)
      if current_user.has_role?(:developer)
        tasks_url
      elsif current_user.has_role?(:newuser)  
        root_url
      else  
        users_path
      end 
    end  
end
