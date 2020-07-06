Rails.application.routes.draw do
  namespace :api do
    namespace :vi do
      resources :robots do
        resources :weapons
        resources :armors
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
