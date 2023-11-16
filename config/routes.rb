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
  devise_scope :sessions do
    get 'register/:id', to: 'gnt_users#register', as: :register
    get 'professional_info/:id', to: 'gnt_users#professional_info', as: :professional_info
    get 'professional_info_show/:id', to: 'gnt_users#professional_info_show', as: :professional_info_show
    get 'english_exam/:id', to: 'gnt_users#english_exam', as: :english_exam
    get 'english_exam_show/:id', to: 'gnt_users#english_exam_show', as: :english_exam_show
    get 'nclex/:id', to: 'gnt_users#nclex', as: :nclex
    get 'nclex_show/:id', to: 'gnt_users#nclex_show', as: :nclex_show
    get 'licensing/:id', to: 'gnt_users#licensing', as: :licensing
    get 'licensing_show/:id', to: 'gnt_users#licensing_show', as: :licensing_show
    get 'jobs/:id', to: 'gnt_users#jobs', as: :jobs
    get 'jobs_show/:id', to: 'gnt_users#jobs_show', as: :jobs_show
    get 'immigration/:id', to: 'gnt_users#immigration', as: :immigration
    get 'immigration_show/:id', to: 'gnt_users#immigration_show', as: :immigration_show
    get 'screening/:id', to: 'gnt_users#screening', as: :screening
    get 'onboarding/:id', to: 'gnt_users#onboarding', as: :onboarding
  end
  resources :gnt_users, only: [:index, :show, :edit, :update] do 
    member do
      delete 'delete_image/:image:id', action: 'delete_image', as: 'delete_image'
    end
  end

  get 'admin_pages/statistics', to: 'admin_pages#statistics'
 
  get 'candidates_pages/application_status'
end
