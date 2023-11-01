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
    puts("check terms before", params[:gnt_user][:terms_of_use])
    respond_to do |format|
      if params[:gnt_user][:terms_of_use] == "0"
        puts("check terms after", params[:gnt_user][:terms_of_use])
        format.html {redirect_to new_gnt_user_registration_url, notice: "Please agree to the Terms and Conditions before proceeding."}
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
  def update
    super  
    # @gnt_user = GntUser.find(params[:id])
    # @gnt_user = GntUser.find_by_id(params[:id])
    # logger.info params[:gnt_user]
    # logger.info 'find user ok'

    respond_to do |format|
      if current_gnt_user.update(gnt_user_params)
        format.html {redirect_to current_gnt_user, notice: "you sccessfully updated your profile!"}
      else 
        format.hmtl {render :edit}
      end
    end
  end

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

  def gnt_user_params
    params.require(:gnt_user).permit(
      :full_name,
      :id,
      :terms_of_use
    )
  end
end
