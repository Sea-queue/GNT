class AdminPagesController < ApplicationController
  before_action :initialize_search, only: :statistics

  def statistics
    handle_search_name
    handle_filters
  end

  private
  def initialize_search
    @users = GntUser.all
    session[:search_name] ||= params[:search_name]
    session[:filter] = params[:filter]
    params[:filter_option] = nil if params[:filter_option] == ""
    session[:filter_option] = params[:filter_option]
  end

  def handle_search_name
    session[:search_name] = params[:search_name]
    if session[:search_name]
      @users = GntUser.where(legal_name: session[:search_name])
    else
      @users = GntUser.all
    end
  end

  def handle_filters
    if session[:filter_option] && session[:filter] == "nationality"
      @users = GntUser.all.where(nationality: session[:filter_option])
    elsif session[:filter_option] && session[:filter] == "languages_spoken"
      puts("filter:", session[:filter_option])
      @users = @users.where(languages_spoken: session[:filter_option])
    end
  end
end