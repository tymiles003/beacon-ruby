require 'rails_helper'

describe Users::OmniauthCallbacksController do 
  let(:user){create(:user)}
	
  before do 
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.params"] = {"id" => user.id}
  end

  context '#facebook' do 
  	it 'responds successfully' do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  		post :facebook, format: :json
      expect(response).to have_http_status 302
  	end
  end

  context '#twitter' do 
    it 'responds successfully' do 
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
      post :twitter, format: :json
      expect(response).to have_http_status 302
    end
  end

  context '#instagram' do 
    it 'responds successfully' do 
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:instagram]
      post :instagram, format: :json
      expect(response).to have_http_status 302
    end
  end

  context '#linkedin' do 
    it 'responds successfully' do 
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:linkedin]
      post :linkedin, format: :json
      expect(response).to have_http_status 302
    end
  end

  context '#tumblr' do 
    it 'responds successfully' do 
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:tumblr]
      post :tumblr, format: :json
      expect(response).to have_http_status 302
    end
  end

end