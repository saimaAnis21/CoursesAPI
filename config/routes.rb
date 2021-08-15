Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses
  resources :category_names , only: :index
  post 'authentication', to: 'authentication#create'
  post 'signup', to: 'users#create'
end
