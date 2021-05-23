Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'home#index'

  devise_for :users, path:'', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :posts do
    member do
      post :publish
    end
  end

  namespace :admin do
    get '/', to: 'application#index'
    resources :users
    resources :posts
  end
end
