Rails.application.routes.draw do
  resources :cards do
  	collection do
  		post 'check'
  	end
  end
  root 'cards#random'
  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
