class PlacesController < ApplicationController
  before_filter :authenticate_user!
  def show
    @place = Place.find(params[:id])
  end

  # def vote_up
  #   begin
  #     current_user.vote_for(@nomination = Place.find(params[:id]))
  #     render :nothing => true, :status => 200
  #   rescue ActiveRecord::RecordInvalid
  #     render :nothing => true, :status => 404
  #   end
  # end

end