class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:family_name,:first_name,:family_name_kana,:first_name_kana,:age,:request,:birth_day])
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      coaches_path
    when Coach
      users_path
    end
  end

end
