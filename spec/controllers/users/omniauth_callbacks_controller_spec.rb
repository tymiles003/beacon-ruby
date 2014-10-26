require 'rails_helper'

describe Users::OmniauthCallbacksController do 
	
  before do 
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  context '#facebook' do 
  	it 'responds successfully' do
  		post :facebook, format: :json
  	end
  end

  context '#twitter' do 
    it 'responds successfully' do 
      post :twitter, format: :json
    end
  end

  context '#instagram' do 
    it 'responds successfully' do 
      post :instagram, format: :json
    end
  end

  context '#linkedin' do 
    it 'responds successfully' do 
      post :linkedin, format: :json
    end
  end

  context '#tumblr' do 
    it 'responds successfully' do 
      post :tumblr, format: :json
    end
  end

end