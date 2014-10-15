require 'rails_helper'

describe V1::UsersController do
	let(:user){create(:user)}
 
	before do
		sign_in user
	end

	context '#show' do
		it "responds successfully" do
			get :show, id: user.id, format: :json
			expect(response).to have_http_status(200)
		end
	end

	context '#social' do 
		it "Facebook responds successfully" do 
			put :social, user_id: user.id, type: 'facebook', link: 'http://facebook.com', format: :json
			expect(response).to have_http_status 200
		end
		it "Twitter responds successfully" do 
			put :social, user_id: user.id, type: 'twitter', link: 'http://twitter.com', format: :json
			expect(response).to have_http_status 200
		end
		it "Instagram responsds successfully" do 
			put :social, user_id: user.id, type: 'instagram', link: 'http://instagram.com', format: :json
			expect(response).to have_http_status 200
		end
		it "LinkedIn responds successfully" do 
			put :social, user_id: user.id, type: 'linkedin', link: 'http://linkedin.com', format: :json
			expect(response).to have_http_status 200
		end
		it "Tumblr responds successfully" do 
			put :social, user_id: user.id, type: 'tumblr', link: 'http://tumblr.com', format: :json
			expect(response).to have_http_status 200
		end
		it "Fails on nothing" do 
			# post :social, user_id: user.id, format: :json
			# expect(response).to have_http_status 400
		end
	end
end