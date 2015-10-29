Rails.application.routes.draw do
  #devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root 'pages#home'
  get '/about', to: 'pages#about', as: :about
  get '/contact-us', to: 'pages#contact', as: :contact

  resources :items
end
