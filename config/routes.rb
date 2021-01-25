Rails.application.routes.draw do

  root to: 'public/homes#top'

  devise_for :customers, controllers: {
     sessions:      'devise/publics/sessions',
     passwords:     'devise/publics/passwords',
     registrations: 'devise/publics/registrations'
   }


  devise_for :admins, controllers: {
     sessions:      'devise/admins/sessions',
     passwords:     'devise/admins/passwords',
     registrations: 'devise/admins/registrations'
   }

   namespace :public do
    get 'homes/top'
    resources :addresses,only: [:index, :create, :destroy, :edit, :update]
    # 会員
    get "customers/withdrawal" => "customers#withdrawal"
    patch "customers/withdrawal" => "customers#withdrawal"
    resources :customers, only: [:show, :edit, :update, :destroy]
    get 'items/new'
    resources :items
    resources :cart_items
   resources :cart_items, only: [:index, :create, :destroy, :update]
   delete 'cart_items_all' => 'cart_items#destroy_all'
    get "genres" => "items#genres", as: 'genres'
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]
  end

   namespace :admin do
    get 'homes/top'
    resources :customers
    get 'genres/new'
    #items、genresコントローラーのネームスペースのルーテイング
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end



end
