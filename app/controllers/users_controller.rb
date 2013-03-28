class UsersController < ApplicationController
  # skip_authorization_check :only => [:show, :renter_search]

  def show
    @user = User.find(params[:id])
  end
end