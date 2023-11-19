Rails.application.routes.draw do
  root 'home#index'
  resources :exercises do
    collection do
      get 'filter'
    end
  end
  resources :movement_patterns
  resources :muscles
  resources :muscle_groups
  resources :tools do
    collection do
      get 'list'
    end
  end
  # constraints Rodauth::Rails.authenticate(:admin) do
    
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
