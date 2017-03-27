Rails.application.routes.draw do
  resources :categories do
    resources :projects
  end
  resources :users

  resources :projects, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
