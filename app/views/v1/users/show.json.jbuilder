json.success true
json.info "User Processed"
json.user do 
  json.partial! 'v1/users/user', user: @user
end