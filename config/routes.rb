Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "filter_categories_profile", to: "categories#filter_show"
  get "filter_categories_profiles", to: "categories#filter_index"

  resources :profiles, only: [:index, :show]
  resources :curriculums, only: [:create]

  resources :own_skills, only: [:create, :destroy]
  resources :own_company_skills, only: [:create, :destroy]

  resources :company_skills, only: [:index, :create]
  resources :categories, only: [:create]

  resources :projects, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
