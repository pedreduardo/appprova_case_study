Rails.application.routes.draw do
  namespace :site do
    get 'home/index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  namespace :backoffice do
    resources :admins, except: [:show]
    resources :members, except: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members

  root 'site/home#index'
end
