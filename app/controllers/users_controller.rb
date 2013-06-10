class UsersController < ApplicationController
  def index
    @users = User.limit(50)
  end
end
