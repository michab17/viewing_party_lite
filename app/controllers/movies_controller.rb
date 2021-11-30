class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def search
    @user = User.find(params[:user_id])
    if params[:q]
      render '/partials/_top_rated.html.erb'
    elsif params[:search]
      @result = params[:search]
      render '/partials/_search_results.html.erb'
    else
      redirect_to user_discover_path(@user)
    end
  end
end
