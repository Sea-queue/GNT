class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password, :full_name, :nationality, :i_am, :years_of_experience, :apply_visa_for, :current_resident, :avatar, :RN_License)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :email, :password, :current_password, :full_name, :nationality, :i_am, :years_of_experience, :apply_visa_for, :current_resident, :avatar, :RN_License)}
    end
end
