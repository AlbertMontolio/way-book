Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "filter_profile_by_category", to: "categories#filter_profile_by_category"
  
  # index
  #   categories
  get "filter_profiles_by_category_by_company_skill", to: "categories#filter_profiles_by_category_by_company_skill"
  
  get "remove_category_session", to: "categories#remove_category_session"
  #   company skills
  get "profiles/filter/company_skills_add_to_session", to: "company_skills#filter_index_all_profiles_add_to_session", as: :filter_index_all_profiles_add_to_session
  get "profiles/filter/company_skills_remove_from_session", to: "company_skills#filter_index_all_profiles_remove_from_session", as: :filter_index_all_profiles_remove_from_session

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
