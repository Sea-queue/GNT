# frozen_string_literal: true

class GntUsers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # puts("check terms before", GntUser.new.resume.blank?)
    respond_to do |format|
      if params[:gnt_user][:terms_of_use] == "0" or 
         params[:gnt_user][:full_name] == "" or 
         params[:gnt_user][:i_am] == "" or 
         params[:gnt_user][:years_of_experience] == "" or 
         params[:gnt_user][:nationality] == "" or
         params[:gnt_user][:phone_number] == ""
        # puts("check terms after", params[:gnt_user][:terms_of_use])
        format.html {redirect_to new_gnt_user_registration_url, notice: "Please fill all the required fields *."}
      else
        super
        return
      end
    end 
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def after_sign_up_path_for(resource)
    register_path(current_gnt_user)
  end

  def gnt_user_params
    params.require(:gnt_user).permit(
      :full_name,
      :id,
      :terms_of_use
    )
  end
end
