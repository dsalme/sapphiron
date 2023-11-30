# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  # public routes
  resources :exercises do
    collection do
      get 'filter'
    end
  end
  resources :routines
  resources :blocks
  # private routes
  resources :aspects
  devise_for :users
  resources :movement_patterns
  resources :muscles
  resources :muscle_groups
  resources :tools do
    collection do
      get 'list'
    end
  end
  resources :protocols
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
