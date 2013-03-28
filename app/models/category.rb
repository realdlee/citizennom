class Category < ActiveRecord::Base
  has_many :places
  has_many :places, through: :place_categories
  has_many :place_categories

  attr_accessible :name
  validates_presence_of :name

  def to_param
    "#{id}-best-#{name}.html"
  end
end
