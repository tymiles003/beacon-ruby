require 'open-uri'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :instagram, :linkedin, :tumblr]

  has_many :invisible_areas
  has_many :identities

  mount_uploader :profile_image, UserUploader

  def add_omniauth(auth, type)
    self["#{type}_url"] = self.class.url_from_omniauth(auth, type)
  end

  def self.url_from_omniauth(auth, type)  
    if type == 'facebook'
      return auth.info.urls["Facebook"]
    elsif type == 'twitter'
      return auth.info.urls["Twitter"]
    elsif type == 'instagram'
      return "https://instagram.com/#{auth.info.nickname}"
    elsif type == 'linkedin'
      return auth.info.urls["public_profile"]
    elsif type == 'tumblr'
      return auth.info.blogs.first["url"]
    end
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

  def email_required?
    super && provider.blank?
  end

  def social_urls
    urls = {}
    for type in self.class.social_types
      unless self["#{type}_url"].nil?
        urls[type] = self["#{type}_url"] 
      end
    end
    urls
  end

  def self.social_types
    ["facebook", "twitter", "instagram", "linkedin", "tumblr"]
  end

end