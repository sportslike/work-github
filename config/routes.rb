Rails.application.routes.draw do


  namespace :admin do
    get 'genres/new'
  end
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
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
