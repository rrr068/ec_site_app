Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customer/sessions',
    registrations: 'custoomer/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  root to: 'pages#home'

  # get '/up/', to: 'up#index', as: :up
  # get '/up/databases', to: 'up#databases', as: :up_databases
  
end
