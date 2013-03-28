class PlaceCategoryController < ApplicationController
  before_filter :authenticate_user!

  def vote_up
    begin
      current_user.vote_for(@nomination = PlaceCategory.find(params[:id]))
      redirect_to :root
      # render :nothing => true, :status => 200
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end
end