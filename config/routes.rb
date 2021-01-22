Rails.application.routes.draw do



  namespace :admin do
    get 'genres/new'
  end

  root to: 'public/homes#top'

  namespace :public do
    get 'homes/top'
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
