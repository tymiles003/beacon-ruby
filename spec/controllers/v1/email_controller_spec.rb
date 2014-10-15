require 'rails_helper'

describe V1::EmailsController do
	let(:user){create(:user)}
 
	context '#new' do
		it "responds successfully" do
			get :new, email: user.email, format: :json
			expect(response).to have_http_status(200)
		end
	end

end