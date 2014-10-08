json.success true
json.info "User Processed"
json.data do 
  json.user do
    json.partial! 'v1/users/user', artist: @user
  end
end