Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'readings#index'
  get 'readings', to: 'readings#index'
  post 'readings', to: 'readings#create'
  get 'readings/:id', to: 'readings#show'
  get 'stats', to: 'readings#stats'
end
