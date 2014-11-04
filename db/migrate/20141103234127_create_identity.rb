class CreateIdentity < ActiveRecord::Migration
  def change
    create_table :identities do |t|
    	t.string :provider
    	t.string :uid
    	t.belongs_to :user
    end
  end
end
