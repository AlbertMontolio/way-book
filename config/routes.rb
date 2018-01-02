Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # - index
  # -- all profiles
  # ---- categories
  get "add_category_session", to: "categories#add_category_session"
  get "remove_category_session", to: "categories#remove_category_session"

  # ---- company skills
  get "add_company_skill_session", to: "company_skills#add_company_skill_session"
  get "remove_company_skill_session", to: "company_skills#remove_company_skill_session"

  # -- profile
  get "filter_profile_by_category", to: "categories#filter_profile_by_category"


  resources :profiles, only: [:index, :show] do
    resources :own_company_skills, only: [:create, :destroy]
    get "filter_profile_per_categories", to: "categories#filter_show"
  end
  resources :curriculums, only: [:create]

  resources :own_skills, only: [:create, :destroy]
  

  resources :company_skills, only: [:index, :create]
  resources :categories, only: [:create]

  resources :projects, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
