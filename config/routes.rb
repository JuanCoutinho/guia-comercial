Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users
    resources :companies

    resources :companies, only: [:index, :show]
  
    namespace :admin do
      resources :companies
    end
  
    root "companies#index"
  end
  
end
