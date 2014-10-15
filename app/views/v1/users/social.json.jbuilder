json.user do 
	json.partial! 'v1/users/user', user: current_user
end
json.info "Social Url Updated"
json.success true