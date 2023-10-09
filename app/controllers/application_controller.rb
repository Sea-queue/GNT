class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
        :role, 
        :email, 
        :password, 
        :full_name, 
        :nationality, 
        :i_am, 
        :years_of_experience, 
        :apply_visa_for, 
        :current_resident, 
        :avatar,
        :first_name,
        :legal_name,
        :terms_of_use,
        :where_hear,
        :year_of_graduation,
        :currently_working,
        :langauges_spoken,
        :phone_number,
        :auth_whatsapp,
        :auth_text,
        :license_type,
        :stage3_1,
        :clinical_hour,
        :other_1,
        :other_2,
        :other_3,
        :english_proficiency,
        :english_exam_pass_date,
        :background_check,
        :convicted_crime,
        :disorder
      )}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(
        :role, 
        :email, 
        :password, 
        :full_name, 
        :nationality, 
        :i_am, 
        :years_of_experience, 
        :apply_visa_for, 
        :current_resident, 
        :avatar,
        :first_name,
        :legal_name,
        :terms_of_use,
        :where_hear,
        :year_of_graduation,
        :currently_working,
        :langauges_spoken,
        :phone_number,
        :auth_whatsapp,
        :auth_text,
        :license_type,
        :stage3_1,
        :clinical_hour,
        :other_1,
        :other_2,
        :other_3,
        :english_proficiency,
        :english_exam_pass_date,
        :background_check,
        :convicted_crime,
        :disorder
      )}
    end
end
