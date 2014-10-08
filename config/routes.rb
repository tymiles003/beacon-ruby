Rails.application.routes.draw do
  namespace :v1 do 
    devise_for :users
    resources :users, only: [:show]
  end
end
