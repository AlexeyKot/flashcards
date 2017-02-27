Rails.application.routes.draw do
  get 'oauths/oauth'

  get 'oauths/callback'

	resources :cards do
		collection do
			post 'check'
		end
	end
	resources :users, only: [:new, :create, :edit]
	resources :sessions, only: [:new, :create, :destroy]
	root 'cards#random'
	get 'static_pages/home'
	get '/sign_up', to: 'users#new', as: :sign_up
	get '/log_in', to: 'sessions#new', as: :log_in
	delete '/log_out', to: 'sessions#destroy', as: :log_out

  #Oauth
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
