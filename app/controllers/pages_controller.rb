class PagesController < ApplicationController
  def home
    @places = Place.all
    @categories = Category.all
  end
end
