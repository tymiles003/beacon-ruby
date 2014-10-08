FactoryGirl.define do

	sequence(:email) do |i|
		"email#{i}@gmail.com"
	end

  factory :user do
    email { generate(:email) }
    url 'http://google.com'
    password 'Password'
    password_confirmation { password }
  end
end
