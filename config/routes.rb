Rails.application.routes.draw do
  
  devise_for :user, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

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

    resource :social_profile, only: [:create, :update, :destroy]
  end
  
end
