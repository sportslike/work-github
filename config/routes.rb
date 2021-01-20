Rails.application.routes.draw do
  namespace :admins do
    get 'homes/top'
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    resources :sessions
  end

end
