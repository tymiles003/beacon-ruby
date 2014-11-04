class Identity < ActiveRecord::Base

	belongs_to :user

	def self.from_omniauth(auth, user_id)
		find_or_create_by(uid: auth['uid'], provider: auth['provider'], user_id: user_id)
	end

end