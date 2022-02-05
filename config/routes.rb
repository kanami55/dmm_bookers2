Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  resources :books, only:[:create, :index, :show, :edit, :destroy,:update] do
    resource :favorites, only:[:create, :destroy]
  resources :book_comments, only:[:create, :destroy]
  end
  resources :users, only:[:new, :create, :index, :show, :edit, :update,:destroy] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
end
