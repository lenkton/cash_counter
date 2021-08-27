Rails.application.routes.draw do
  devise_for :users
  root to: 'invoices#index'

  resources :invoices, only: %i[new create index show]
  resources :payments, only: %i[new create index show]
  resources :procurement_lots, only: %i[new create index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
