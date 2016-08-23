Rails.application.routes.draw do
  resources :anexos

  resources :imovels

  resources :veiculos

  resources :empresas

  resources :socios

  root to: 'visitors#index'

  match 'iniciaBusca', controller: 'empresas', action: 'initBusca', via: 'get'

  match 'buscar', controller: 'empresas', action: 'busca', via: 'get'

end
