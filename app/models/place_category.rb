class PlaceCategory < ActiveRecord::Base
  attr_accessible :category_id, :place_id

  acts_as_voteable

  belongs_to :place
  belongs_to :category

end
