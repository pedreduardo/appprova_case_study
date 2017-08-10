Rails.application.routes.draw do
  namespace :site do
    get 'home/index'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :students, only: [:index]
      post 'students/add_to_member', to: 'students#add_to_member'
    end
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  namespace :backoffice do
    resources :admins, except: [:show]
    resources :members, except: [:show]
    resources :students, except: [:show] do
      collection do
        post :import
      end
    end
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members

  root 'site/home#index'
end