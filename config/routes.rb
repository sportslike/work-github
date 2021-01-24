Rails.application.routes.draw do



  namespace :public do
    get 'items/new'
    resources :items
    resources :cart_items
   resources :cart_items, only: [:index, :create, :destroy, :update]
   delete 'cart_items_all' => 'cart_items#destroy_all'
    get "genres" => "items#genres", as: 'genres'
  end
  namespace :admin do
    get 'genres/new'
  end

  root to: 'public/homes#top'

  namespace :public do
    get 'homes/top'
    resources :addresses,only: [:index, :create, :destroy, :edit, :update]
    # 会員
    get "customers/withdrawal" => "customers#withdrawal"
    patch "customers/withdrawal" => "customers#withdrawal"
    resources :customers, only: [:show, :edit, :update, :destroy]
  end
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

   namespace :admin do
    get 'homes/top'
    resources :customers
  end

  #items、genresコントローラーのネームスペースのルーテイング
   namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
end
end
