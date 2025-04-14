Rails.application.routes.draw do
  resources :produtos do
    get :buscar_por_codigo, on: :collection
  end

  get 'dashboard/index'
  get 'relatorios', to: 'relatorios#index'
  get 'produtos/buscar_por_codigo', to: 'produtos#buscar_por_codigo'

  resources :encomendas do
    get 'novo_produto_campo', on: :collection
  end

  resources :compras
  resources :clientes
  resources :dividas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "dashboard#index"

end
