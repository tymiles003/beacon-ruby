require 'open-uri'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :instagram, :linkedin, :tumblr]

  has_many :invisible_areas
  has_many :social_profiles

  mount_uploader :profile_image, UserUploader

  def self.from_omniauth(auth, type)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
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

end