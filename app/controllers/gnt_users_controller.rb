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
          format.html {redirect_back fallback_location: root_path, notice: "You successfully updated your profile!"}
        end
      else
        format.hmtl {render :edit}
      end
    end
    # update stage status for progress bar
    update_stage_status()
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
      :email,
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
      :stage_1,
      :stage_2,
      :check_list_0,
      :check_list_1,
      :check_list_2,
      :check_list_3,
      :check_list_4,
      :check_list_5,
      :check_list_6,
      :check_list_7,
      :check_list_8,
      :check_list_9,
      :check_list_11,
      :check_list_12,
      transcript: [],
      transcript_translate: [],
      visa: []
    )
  end

  # update stage status for progress bar
  def update_stage_status()
    puts("stage_status", gnt_user_params)
    puts("done")
    # @user.stage_1 = false
    # @user.save
    # getting started
    if !@user.stage_1
      if @user.english_proficiency_result.attached? or gnt_user_params[:request_english_assessment] == "1"
        @user.stage_1 = true
        @user.save
      end
    else
      if !@user.english_proficiency_result.attached? and gnt_user_params[:request_english_assessment] == "0"
        @user.stage_1 = false
        @user.save
      end
    end
    # Basic info
    if !@user.stage_2
      if gnt_user_params[:full_name] != '' and
         gnt_user_params[:nationality] != '' and
         gnt_user_params[:current_resident] != '' and
         gnt_user_params[:i_am] != '' and
         gnt_user_params[:years_of_experience] != '' and
         gnt_user_params[:phone_number] != '' and
         @user.resume.attached? and
         gnt_user_params[:request_to_apply] == '1'
        @user.stage_2 = true
        @user.save
      end
    else
      if gnt_user_params[:full_name] == '' or
         gnt_user_params[:nationality] == '' or
         gnt_user_params[:current_resident] == '' or
         gnt_user_params[:i_am] == '' or
         gnt_user_params[:years_of_experience] == '' or
         !@user.resume.attached? or
         gnt_user_params[:request_to_apply] == '0'
        @user.stage_2 = false
        @user.save
      end
    end
    # Professional Info
    if !@user.stage_3
      if @user.rn_license_upload.attached? and 
         gnt_user_params[:license_type] != '' and 
         gnt_user_params[:stage3_1] == '1'
        @user.stage_3 = true
        @user.save
      end
    else 
      if !@user.rn_license_upload.attached? or 
         gnt_user_params[:license_type] == '' or 
         gnt_user_params[:stage3_1] == '0'
        @user.stage_3 = false
        @user.save
      end
    end
    # English Exam
    if !@user.stage_4
      if @user.english_proficiency == 'passed'
        @user.stage_4 = true
        @user.save
      end
    else 
      if @user.english_proficiency != 'passed'
        @user.stage_4 = false
        @user.save
      end
    end
    # NCLEX
    if !@user.stage_5
      if gnt_user_params[:nclex_rn] != '' and 
         gnt_user_params[:nclex_rn_state] != ''
        @user.stage_5 = true
        @user.save
      end
    else
      if gnt_user_params[:nclex_rn] == '' or 
         gnt_user_params[:nclex_rn_state] == 'None'
        @user.stage_5 = false
        @user.save
      end 
    end
    # Employer Interview
    if !@user.stage_6
      if @user.interview_status == 'Complete'
        @user.stage_6 = true
        @user.save
      end
    else
      if !@user.interview_status == 'Complete'
        @user.stage_6 = false
        @user.save
      end
    end
    # Licensing
    if !@user.stage_7
      if gnt_user_params[:rn_in_us] == '1' and
         gnt_user_params[:rn_in_us_state] != '' and
         gnt_user_params[:license_number] != '' and
         gnt_user_params[:expiration_date] != '' and
         gnt_user_params[:background_check] == '1'
        @user.stage_7 = true
        @user.save
      end
    else
      if gnt_user_params[:rn_in_us] == '0' or
         gnt_user_params[:rn_in_us_state] == '' or
         gnt_user_params[:license_number] == '' or
         gnt_user_params[:expiration_date] == '' or
         gnt_user_params[:background_check] == '0'
        @user.stage_7 = false
        @user.save
      end 
    end
    # VisaScreen
    if !@user.stage_8
      if @user.visascreen_status == 'Complete'
        @user.stage_8 = true
        @user.save
      end
    else 
      if !@user.visascreen_status == 'Complete'
        @user.stage_8 = false
        @user.save
      end
    end
    # Immigration
    if !@user.stage_9
      if gnt_user_params[:check_list_0] == '1' and
         gnt_user_params[:check_list_1] == '1' and
         gnt_user_params[:check_list_2] == '1' and
         gnt_user_params[:check_list_3] == '1' and
         gnt_user_params[:check_list_4] == '1' and
         gnt_user_params[:check_list_5] == '1' and
         gnt_user_params[:check_list_6] == '1' and
         gnt_user_params[:check_list_7] == '1' and
         gnt_user_params[:check_list_8] == '1' and
         gnt_user_params[:check_list_9] == '1' and
         gnt_user_params[:check_list_11] == '1' and
         gnt_user_params[:check_list_12] == '1' and
        @user.stage_9 = true
        @user.save
      end
    else
      if gnt_user_params[:check_list_0] == '0' or
         gnt_user_params[:check_list_1] == '0' or
         gnt_user_params[:check_list_2] == '0' or
         gnt_user_params[:check_list_3] == '0' or
         gnt_user_params[:check_list_4] == '0' or
         gnt_user_params[:check_list_5] == '0' or
         gnt_user_params[:check_list_6] == '0' or
         gnt_user_params[:check_list_7] == '0' or
         gnt_user_params[:check_list_8] == '0' or
         gnt_user_params[:check_list_9] == '0' or
         gnt_user_params[:check_list_11] == '0' or
         gnt_user_params[:check_list_12] == '0'
        @user.stage_9 = false
        @user.save
      end
    end
    # Onboarding
    if !@user.stage_10
      if false
        @user.stage_10 = true
        @user.save
      end
    end
  end

end
