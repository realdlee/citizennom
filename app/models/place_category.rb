class PlaceCategory < ActiveRecord::Base
  attr_accessible :category_id, :place_id

  acts_as_voteable

  belongs_to :place
  belongs_to :category

  def self.votes_for(place_id, category_id)
    PlaceCategory.find_by_place_id_and_category_id(place_id, category_id).votes.size
  end

end
