Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :edit, :index, :update]do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'home_about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/search", to: "searches#search"
end