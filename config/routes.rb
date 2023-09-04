Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "home#index"
  # get 'home/index'
  get 'home/about'
  get 'home/terms_of_use'
  get 'home/privacy_policy'
  get 'home/state_law_privacy_policy'
  devise_for :gnt_users
end
