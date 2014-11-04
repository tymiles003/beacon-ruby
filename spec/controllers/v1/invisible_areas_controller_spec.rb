require 'rails_helper'

describe V1::InvisibleAreasController do
	let(:user){create(:user)}
	let(:invisible_area){create(:invisible_area, user: user)}

	before do 
		sign_in user
	end

	context '#create' do
		it 'responds successfully' do 
			post :create, invisible_area: attributes_for(:invisible_area), format: :json
			expect(response).to have_http_status 200
		end
	end

	context '#update' do
		it 'responds successfully' do 
			put :update, id: invisible_area.id, invisible_area: invisible_area.serializable_hash, format: :json
			expect(response).to have_http_status 200
		end
	end

	context '#destroy' do 
		it 'responds successfully' do 
			delete :destroy, id: create(:invisible_area).id, format: :json
			expect(response).to have_http_status 204
		end
	end

end