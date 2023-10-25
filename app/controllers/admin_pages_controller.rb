class AdminPagesController < ApplicationController
  before_action :initialize_search

  def statistics
    handle_search_name
    handle_filters
  end

  private
  def initialize_search
    @users = GntUser.where(role: "candidate")
  end

  def handle_search_name
    if params[:search_name] and params[:search_name] != ""
      @users = GntUser.where(legal_name: params[:search_name])
    end
  end

  def handle_filters
    if params[:nationality_filter] and params[:nationality_filter] != ""
      puts('nationality_filter', params[:nationality_filter])
      @users = @users.where(nationality: params[:nationality_filter])
    end
    if params[:experience_years_filter] and params[:experience_years_filter] != ""
      puts('experience_years_filter', params[:experience_years_filter])
      @users = @users.where(years_of_experience: ['3', '4', '5+'])
    end
    if session[:english_proficiency_filter]
      puts('english_proficiency_filter')
      @users = @users.where(english_proficiency: session[:english_proficiency_filter])
    end
    if params[:nclex_filter] and params[:nclex_filter] != ""
      puts('nclex_filter', params[:nclex_filter])
      @users = @users.where(nclex_rn: params[:nclex_filter])
    end
    if session[:languages_spoken_filter]
      puts('languages_spoken_filter')
      @users = @users.where(languages_spoken: session[:languages_spoken_filter])
    end
  end
end