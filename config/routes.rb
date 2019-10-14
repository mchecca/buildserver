Rails.application.routes.draw do
  get 'home/index'
  resources :projects, only: [:new, :edit, :index, :create, :update, :show] do
    resources :builds, only: [:index, :build] do
      member do
        post 'build'
      end
    end
  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
