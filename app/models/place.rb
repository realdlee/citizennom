class Place < ActiveRecord::Base
  has_many :categories, through: :place_categories
  has_many :place_categories


  attr_accessible :name, :category_ids
  validates_presence_of :name
  validates_length_of :name, maximum: 90

  # acts_as_voteable

  def to_param
    "#{id}-#{name.parameterize}.html"
  end
end
