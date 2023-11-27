class GntUsersController < ApplicationController
  before_action :authenticate_gnt_user!, only:[:show]

  def index
  end

  def show
    # to prevent candidates to check other candidates by changing the id number in the URL
    if current_gnt_user.role == 'admin'
      @user = GntUser.find(params[:id])
    else 
      @user = current_gnt_user
    end 
  end

  def edit
    if current_gnt_user.role == 'admin'
      @user = GntUser.find(params[:id])
    else 
      @user = current_gnt_user
    end
  end

  def update
    if current_gnt_user.role == 'admin'
      @user = GntUser.find(params[:id])
    else 
      @user = current_gnt_user
    end 
    respond_to do |format|
      if @user.update(gnt_user_params)
        if params[:gnt_user][:request_to_apply]
          format.html {redirect_to current_gnt_user, notice: "Request has been sent!"}
        elsif params[:gnt_user][:grant_apply_request]
          format.html {redirect_to admin_pages_statistics_path, notice: "Grant Success!"}
        else
          format.html {redirect_back fallback_location: root_path, notice: "you successfully updated your profile!"}
        end
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

  def register
    @user = current_gnt_user
    @prog = 50
  end

  def professional_info
    @user = current_gnt_user
  end

  def professional_info_show
    @user = current_gnt_user
  end

  def english_exam
    @user = current_gnt_user
  end

  def english_exam_show
    @user = current_gnt_user
  end

  def nclex
    @user = current_gnt_user
  end

  def nclex_show
    @user = current_gnt_user
  end

  def licensing
    @user = current_gnt_user
  end

  def licensing_show
    @user = current_gnt_user
  end

  def jobs
    @user = current_gnt_user
  end

  def jobs_show
    @user = current_gnt_user
  end

  def immigration
    @user = current_gnt_user
  end

  def immigration_show
    @user = current_gnt_user
  end

  def screening
    @user = current_gnt_user
  end

  def screening_show
    @user = current_gnt_user
  end

  def onboarding
    @user = current_gnt_user
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
      :legal_name,
      :terms_of_use,
      :where_hear,
      :year_of_graduation,
      :currently_working,
      :languages_spoken,
      :country_code,
      :phone_number,
      :auth_whatsapp,
      :auth_text,
      :request_to_apply,
      :grant_apply_request,
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
      :request_english_assessment,
      :current_resident_state,
      :top_specialties,
      :medical_surgical,
      :pediatrics,
      :obstetrics_gynecology,
      :psychiatry,
      :emergency,
      :critical_care_icu,
      :geriatrics_nursing_home,
      :other_specialty_name,
      :other_specialty_hour,
      :license_number,
      :expiration_date,
      :additional_active_compact_license,
      :visascreen_status,
      :interview_status,
      :interview_date, 
      transcript: [],
      transcript_translate: [],
      visa: []
    )
  end

end
