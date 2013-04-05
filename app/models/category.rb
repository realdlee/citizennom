class Category < ActiveRecord::Base
  has_many :places
  has_many :places, through: :place_categories
  has_many :place_categories

  attr_accessible :name
  validates_presence_of :name

  def self.vote_total(category_id)
    sum=0
    PlaceCategory.where(category_id: category_id).each do |place_category|
      sum+=place_category.votes.size
    end
    return sum
  end

  def to_param
    "#{id}-best-#{name}.html"
  end
end
