Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "home#index"
  get 'home/about'
  get 'home/faq'
  get 'home/news_feed'
  get 'home/resources'
  get 'home/contact_us'
  get 'home/terms_of_use'
  get 'home/privacy_policy'
  get 'home/state_law_privacy_policy'
  devise_for :gnt_users, controllers: { sessions: 'gnt_users/sessions', registrations: 'gnt_users/registrations' }
  resources :gnt_users, only: [:index, :show, :edit, :update] do 
    member do
      delete 'delete_image/:image:id', action: 'delete_image', as: 'delete_image'
    end
  end

  get 'admin_pages/statistics', to: 'admin_pages#statistics'
  get 'statistics', to: 'admin_pages#statistics'
  get 'candidates_pages/application_status'
  get 'gnt_users/user_application/:id', to: 'gnt_users#user_application'
end
