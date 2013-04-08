class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @sorted_places = @category.places.find(:all).uniq.sort_by{|p| PlaceCategory.find_by_place_id_and_category_id(p.id, @category.id).votes.count}.reverse
    @votes = Category.vote_total(@category.id)
  end
end
