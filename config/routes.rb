Rails.application.routes.draw do
  root to: 'homes#top'

  resources :books

  #post 'books' => 'books#create'

  #get 'books' => 'books#index'

  #get 'books/:id/edit' => 'books#edit', as:'edit_book'

  #get 'books/:id' => 'books#show', as:'book'

  #patch 'books/:id' => 'books#update'

  #delete 'books/:id' => 'books#destroy'

  devise_for :users

  resources :users, only: [:show]
  
end
