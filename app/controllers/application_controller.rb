class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  after_action :save_locale


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
        :rn_lisence,
        :license_type,
        :stage3_1,
        :clinical_hour,
        :other_1,
        :other_2,
        :other_3,
        :cgfns,
        :english_proficiency,
        :english_exam_pass_date,
        :nclex_rn,
        :nclex_rn_state,
        :rn_in_us,
        :rn_in_us_state,
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
        :rn_lisence,
        :license_type,
        :stage3_1,
        :clinical_hour,
        :other_1,
        :other_2,
        :other_3,
        :cgfns,
        :english_proficiency,
        :english_exam_pass_date,
        :nclex_rn,
        :nclex_rn_state,
        :rn_in_us,
        :rn_in_us_state,
        :background_check,
        :convicted_crime,
        :disorder
      )}
    end

  protected def set_locale
    I18n.locale = params[:locale] || # 1: use request parameter, if available
      session[:locale] ||            # 2: use the value saved in iurrent session
      I18n.default_locale            # last: fallback to default locale
  end

  protected def save_locale
    session[:locale] = I18n.locale
  end
end
