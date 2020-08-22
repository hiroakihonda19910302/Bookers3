Rails.application.routes.draw do
	root 'users#top'
  	get 'home/about' => 'users#about'

  	devise_for :users, controllers: {
    	sessions: 'devise/sessions',
    	registrations: 'devise/registrations'
	}
	
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :users, only: [:show, :index, :edit, :create, :update]
  	resources :books, only: [:show, :index, :edit, :create, :update, :destroy]
end
