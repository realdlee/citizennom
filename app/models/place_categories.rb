class PlaceCategories < ActiveRecord::Base
  attr_accessible :category_id, :place_id

  belongs_to :place
  belongs_to :category
end
