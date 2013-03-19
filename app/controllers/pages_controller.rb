class PagesController < ApplicationController
  def home
    @places = Place.all
    @top_restaurants = Category.find(1).places.find(:all, limit: 3)
    @top_coffee = Category.find(2).places.find(:all, limit:3)
    @top_italian= Category.find(3).places.find(:all, limit:3)
    @top_burger = Category.find(4).places.find(:all, limit:3)

    @categories = Category.all
  end
end
