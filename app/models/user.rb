class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invisible_areas

  def update_social_url!(type, url)
  	if type == 'facebook'
  		self.facebook_url = url
  	elsif type == 'twitter'
  		self.twitter_url = url
  	elsif type == 'instagram'
  		self.instagram_url = url
  	elsif type == 'linkedin' 
  		self.linkedin_url = url
  	elsif type == 'tumblr' 
  		self.tumblr_url = url
  	else
  		raise "type doesn't exist"
  	end
  	self.save!
  end

  def profile_urls
    urls = []
    urls.push(self.facebook_url) if self.facebook_url
    urls.push(self.twitter_url) if self.twitter_url
    urls.push(self.instagram_url) if self.instagram_url
    urls.push(self.linkedin_url) if self.linkedin_url
    urls.push(self.tumblr_url) if self.tumblr_url
    return urls
  end

end
