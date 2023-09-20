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

  private

  def gnt_user_params
    params.require(:gnt_user).permit(
      :full_name,
      :nationality,
      :i_am,
      :years_of_experience,
      :apply_visa_for,
      :current_resident
    )
  end

end
