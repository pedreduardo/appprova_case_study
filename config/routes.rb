Rails.application.routes.draw do
  namespace :site do
    get 'home/index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  namespace :backoffice do
    get 'dashboard/index'
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members

  root 'site/home#index'
end
