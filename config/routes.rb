Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  resources :books, only:[:create, :index, :show, :edit, :destroy,:update] do
    resource :favorites, only:[:create, :destroy]
  resources :book_comments, only:[:create, :destroy]
  end
  resources :users, only:[:new, :create, :index, :show, :edit, :update,:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
