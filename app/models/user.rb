class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :instagram, :linkedin, :tumblr]

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

  def social_urls
    urls = {}
    urls["facebook"] = self.facebook_url if self.facebook_url
    urls["twitter"] = self.twitter_url if self.twitter_url
    urls["instagram"] = self.instagram_url if self.instagram_url
    urls["linkedin"] = self.linkedin_url if self.linkedin_url
    urls["tumblr"] = self.tumblr_url if self.tumblr_url
    return urls
  end

  def self.from_omniauth(auth, type)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if type == 'twitter'
        user.twitter_url = auth.info.urls["Twitter"]
        user.profile_image_url = auth.info.image
      end
      user.password = Devise.friendly_token[0,20]
    end
  end

  def profile_image_url=(url)
    # TODO: integrate paperclip
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      elsif data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        binding.pry
      elsif data = session["devise.instagram_data"] && session["devise.instagram_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        binding.pry
      elsif data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        binding.pry
      elsif data = session["devise.tumblr_data"] && session["devise.tumblr_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        binding.pry
      end
    end
  end

end
