Rails.application.routes.draw do
  root "pages#home"
  get 'stafflogin', to: "sessions#new"
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'sessions', to: 'sessions#destroy'
  get 'staffmembers/new', to: 'staff_members#new'
  post 'staffmembers/new', to: 'staff_members#create'
  get 'pages/home'
  get 'pages/help'
  post 'users/new', to: "users#create"
  post 'requests/new' , to: "requests#create"
  get 'requests/all', to: "requests#index"
  get 'requests/show',  to: "requests#show"
  resources :staff_members, only: [:new, :create]
  resources :users do
     resources :requests
  end
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
