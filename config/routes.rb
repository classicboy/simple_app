Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, path:'', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :posts

  namespace :admin do
    get '/', to: 'application#index'
    resources :users
    resources :posts
  end
end
