Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'posts#index'
  get "about" => 'homes#about'
  resources:users, only: [:show, :edit, :update]
  resources:posts do
    resource:favorites, only: [:create, :destroy]
  end
  resources :maps, only: [:new, :create, :index]
  get 'search' => 'searches#search'
end
