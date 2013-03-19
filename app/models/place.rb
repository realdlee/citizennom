class Place < ActiveRecord::Base
  # belongs_to :category  BUT a place can belong to many categories
  has_many :categories, through: :place_categories
  has_many :place_categories
  # has_many :votes

  attr_accessible :name, :category_ids
  validates_presence_of :name
  validates_length_of :name, maximum: 60
end
