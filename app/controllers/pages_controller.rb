class PagesController < ApplicationController
  def home
    @top_restaurants = Category.find(1).places.all.uniq.sort_by{|p| PlaceCategory.find_by_place_id_and_category_id(p.id, 1).votes.count}.reverse
    @restaurant_votes_total = Category.vote_total(1)
    @top_coffee      = Category.find(2).places.all.uniq.sort_by{|p| PlaceCategory.find_by_place_id_and_category_id(p.id, 2).votes.count}.reverse
    @top_burger      = Category.find(3).places.all.uniq.sort_by{|p| PlaceCategory.find_by_place_id_and_category_id(p.id, 3).votes.count}.reverse
    @top_italian     = Category.find(4).places.all.uniq.sort_by{|p| PlaceCategory.find_by_place_id_and_category_id(p.id, 4).votes.count}.reverse
    @coffee_votes_total = Category.vote_total(2)
    @burger_votes_total = Category.vote_total(3)
    @italian_votes_total = Category.vote_total(4)
    # @votes_for_restaurants = Category.find(1).places.each {|place| puts place.votes_for }
  end
end
