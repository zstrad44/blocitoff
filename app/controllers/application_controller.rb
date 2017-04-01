class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
   
  def change_days
    days = @item.days_to_expire
    date = DateTime.beginning_of_day
    expire = @item.created_at
    
    case days
    when 1
      expire = date - 6.days
    when 2
      expire = date - 5.days
    when 3
      expire = date - 4.days
    when 4
      expire = date - 3.days
    when 5
      expire = date - 2.days
    when 6
      expire = date - 1.days
    when 7
      expire = date
    else
      expire = expire
    end
    
    @item.created_at = expire
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :email, :password ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :email, :password, :current_password])
    
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
  
end
