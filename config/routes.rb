Rails.application.routes.draw do
  namespace :admin do
    get 'pages/home'
  end
  namespace :customer do
    get 'orders/index'
    get 'orders/show'
    get 'orders/success'
  end
  
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, controllers: {
   sessions: 'customer/sessions',
   registrations: 'customer/registrations'
 }
  
  root to: 'pages#home'
  get "search" => "searches#search"

  namespace :admin do
    root to: 'pages#home'
    resources :products, only: %i[index show new create edit update]
    resources :orders, only: %i[show update]
  end

  scope module: :customer do
    resources :products, only: %i[index show]
    resources :cart_items, only: %i[index create destroy] do
      member do # idは付与される
        patch 'increase'
        patch 'decrease'
      end
    end
    resources :checkouts, only: [:create]
    resources :webhooks, only: [:create]
    resources :orders, only: %i[index show] do
      collection do # :idが付与されない
        get 'success'
      end
    end
  end

end