class CreateInvisibleAreas < ActiveRecord::Migration
  def change
    create_table :invisible_areas do |t|
    	t.string :name
    	t.string :location
    	t.belongs_to :user
    end
  end
end
