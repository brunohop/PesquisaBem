Rails.application.routes.draw do
  resources :anexos

  resources :imovels

  resources :veiculos

  resources :empresas

  resources :socios

  root to: 'visitors#index'
end
