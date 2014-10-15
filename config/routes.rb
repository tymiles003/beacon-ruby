Rails.application.routes.draw do
  
  devise_for :user

  namespace :v1 do
		devise_scope :user do
			post 'registrations', to: 'registrations#create', as: 'register'
			post 'sessions', to: 'sessions#create', as: 'login'
			delete 'sessions', to: 'sessions#destroy', as: 'logout'
		end
		
    resources :users, only: [:show] do 
    	put 'social', to: 'users#social'
    end

    resource :email, only: [:new]
  end
  
end
