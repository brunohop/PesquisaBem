Rails.application.routes.draw do
  resources :anexos

  resources :imovels

  resources :veiculos

  resources :empresas

  resources :socios

  root to: 'visitors#index'

  match 'iniciaBuscaEmpresa', controller: 'empresas', action: 'initBusca', via: 'get'

  match 'buscarEmpresa', controller: 'empresas', action: 'busca', via: 'get'

  match 'iniciaBuscaCpf', controller: 'socios', action: 'initBusca', via: 'get'

  match 'buscarCpf', controller: 'socios', action: 'busca', via: 'get'

end
