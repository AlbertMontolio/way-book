Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }
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
  get "filter_index_profile_by_category", to: "categories#filter_index_profile_by_category"

  ### do i need this nesting?
  resources :profiles, only: [:index, :show, :edit, :update] do
    # resources :own_company_skills, only: [:create, :destroy, :edit, :update, :index]
    get "filter_profile_per_categories", to: "categories#filter_show" ### refactor
  end

  resources :own_company_skills, only: [:create, :destroy, :edit, :update, :index]

  resources :curriculums, only: [:create]

  resources :own_skills, only: [:create, :destroy]

  resources :company_skills, only: [:index, :create]
  resources :categories, only: [:create]

  resources :projects, only: [:new, :create]

  get "search_employee", to: "searchs#search_employee"
  get "search_skills", to: "searchs#search_skills"
  get "search_by_division", to: "searchs#search_by_division"
  get "search_by_team", to: "searchs#search_by_team"

  # api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :profiles, only: [ :index ]
      resources :users, only: [ :index, :create ]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
