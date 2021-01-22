Rails.application.routes.draw do

  root to: 'public/homes#top'

  namespace :public do
    get 'homes/top'
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

end
