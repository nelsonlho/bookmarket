Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :books
  devise_for :users
  root 'pages#home'
  get 'dashboard' => 'pages#dashboard'

  post '/buy/:slug', to: 'transactions#create', as: :buy
  get '/pickup/:guid', to: 'transactions#pickup', as: :pickup

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
