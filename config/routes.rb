Rails.application.routes.draw do
	resources :cards do
		collection do
			post 'check'
		end
	end
	resources :users, only: [:new, :create]
	root 'cards#random'
	get 'static_pages/home'
	get '/sign_up', to: 'users#new', as: :sign_up

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
