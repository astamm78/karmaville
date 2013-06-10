class UsersController < ApplicationController
  def index
    @total_pages = (User.count / 50)
    if params[:page]
      @users = User.by_karma.page(params[:page])
      @page = params[:page].to_i
    else
      @users = User.by_karma.limit(50)
      @page = 1
    end
  end

  def page
    @total_pages = (User.count / 50)
    if params[:id]
      @users = User.by_karma.page(params[:id])
      @page = params[:id].to_i
      render "index"
    else
      @users = User.by_karma.limit(50)
      @page = 1
      render "index"
    end
  end

end
