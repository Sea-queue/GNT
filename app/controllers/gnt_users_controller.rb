class GntUsersController < ApplicationController
  before_action :authenticate_gnt_user!, only:[:show]

  def index
    @users = GntUser.all
  end

  def show
    @user = GntUser.find(params[:id])
  end

  def edit
    @user = current_gnt_user
  end

  def update
    respond_to do |format|
      if current_gnt_user.update(gnt_user_params)
        format.html {redirect_to current_gnt_user, notice: "you sccessfully updated your profile!"}
      else
        format.hmtl {render :edit}
      end
    end
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    if current_gnt_user == image.record || current_gnt_user.admin?
      # method to delete the image
      image.purge
      redirect_back(fallback_location: request.referer)
    else
      redirect_to root_url, notice: "User didn't match"
    end
  end

  private

  def gnt_user_params
    params.require(:gnt_user).permit(
      :avatar,
      :full_name,
      :nationality,
      :i_am,
      :years_of_experience,
      :apply_visa_for,
      :current_resident,
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
      :disorder,
      :rn_lisence,
      :rn_license_upload,
      :resume,
      :diploma,
      :diploma_translate,
      :cgfns,
      :cgfns_upload,
      :english_proficiency_result,
      :nclex_rn,
      :nclex_rn_state,
      :nclex_rn_upload,
      :rn_in_us,
      :rn_in_us_state,
      :birth_certificate,
      :birth_certificate_translate,
      :passport,
      :entry_stamp,
      transcript: [],
      transcript_translate: [],
      visa: []
    )
  end

end
