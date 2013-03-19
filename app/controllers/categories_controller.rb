class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @sorted_places = @category.places.find(:all).uniq
  end
end
