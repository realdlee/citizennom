class CreatePlaceCategories < ActiveRecord::Migration
  def change
    create_table :place_categories do |t|
      t.integer :category_id
      t.integer :place_id

      t.timestamps
    end
  end
end
