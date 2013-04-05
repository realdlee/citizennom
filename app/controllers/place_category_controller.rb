class PlaceCategoryController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def vote_up
    begin
      current_user.vote_for(@nomination = PlaceCategory.find(params[:id]))
      respond_to do |format|
        format.html { redirect_to :root }
        format.js { render text: "Vote counted" }
      end
      # render :nothing => true, :status => 200
    rescue ActiveRecord::RecordInvalid
      respond_to do |format|

        format.html { redirect_to :root}
        format.js { render text: "Vote not counted"}
      end
    end
  end
end