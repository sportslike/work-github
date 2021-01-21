Rails.application.routes.draw do
  
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

end
