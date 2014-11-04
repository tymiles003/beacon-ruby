class AddGeoDataToInvisibleAreas < ActiveRecord::Migration
  def change
    add_column :invisible_areas, :latitude, :float
    add_column :invisible_areas, :longitude, :float
    add_column :invisible_areas, :range, :int
  end
end
