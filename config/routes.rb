Rails.application.routes.draw do
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'reports/report_by_wallets'
  get 'reports/result_by_category'
  get 'reports/result_by_dates'
  get 'reports/result_by_wallets'
  
  get 'main/index'
  resources :wallets
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'main#index'
end
