Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  resources :users do
       #collection do
       #  get :search
       #end
       member do
         get :follow
         get :follower
       end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
     resources :book_comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
   end
end
