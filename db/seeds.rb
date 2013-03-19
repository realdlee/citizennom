# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Category.table_name)
open("lib/assets/categories.txt").read.each_line do |line|
  name = line.chomp
  Category.find_or_create_by_name!(name)
end

Place.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Place.table_name)
open("lib/assets/places.txt").read.each_line do |line|
    category_id, name, website = line.chomp.split("|")
    Place.find_or_create_by_name_and_website!(name, website)
    if category_id.include? ","
      category_id.split(",").each do |id|
        Place.last.place_categories.create(category_id: id)
      end
    else
      Place.last.place_categories.create(category_id: category_id)
    end
end

# Amenity.delete_all
# ActiveRecord::Base.connection.reset_pk_sequence!(Amenity.table_name)
# open("lib/assets/amenities.txt").read.each_line do |line|
#   name = line.chomp
#   Amenity.find_or_create_by_name!(name)
# end