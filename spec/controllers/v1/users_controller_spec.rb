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
end