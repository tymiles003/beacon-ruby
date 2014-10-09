
json = {
	users: [
		{
			email: "jsksma2@gmail.com",
			url: "http://google.com",
		}
	]
}

json[:users].each do |dict|
	dict["password"] = dict["password_confirmation"] = "Test Password"
	user = User.create!(dict)
	puts "successfully created new user: #{user.email}"
end