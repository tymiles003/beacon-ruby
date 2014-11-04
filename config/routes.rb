Rails.application.routes.draw do
  
  devise_for :user, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :v1 do
		devise_scope :user do
			post 'registrations', to: 'registrations#create', as: 'register'
			post 'sessions', to: 'sessions#create', as: 'login'
			delete 'sessions', to: 'sessions#destroy', as: 'logout'
		end
		
    resource :users, only: [:show]

    resource :email, only: [:new]

    resources :invisible_areas, only: [:create, :update, :destroy]
  end
  
end
