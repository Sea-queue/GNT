class AdminPagesController < ApplicationController
  def statistics
    @users = GntUser.all
  end

  def application_status
  end
end