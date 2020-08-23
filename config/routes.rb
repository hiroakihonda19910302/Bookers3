Rails.application.routes.draw do
    devise_for :users
    root 'users#top'
    get 'home/about' => 'users#about'

    devise_scope :user do
      get 'users/sign_out' => 'devise/sessions#destroy'
    end

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :users, only: [:show, :index, :edit, :update]
  	resources :books, only: [:show, :index, :edit, :create, :update, :destroy]


end
