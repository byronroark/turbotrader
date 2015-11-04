Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'pages#home'
  get '/about', to: 'pages#about', as: :about
  get '/contact_us', to: 'pages#contact', as: :contact

  get '/dashboard', to: 'dashboard#index', as: :dashboard

  get '/users/sign_in', to: 'devise/sessions#new', as: :login

  resources :items do
    collection do
      get :search
    end
  end
end
