class AddSocialUrlsToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :facebook_url
  		t.string :twitter_url
  		t.string :instagram_url
  		t.string :linkedin_url
  		t.string :tumblr_url
  	end
  end
end
