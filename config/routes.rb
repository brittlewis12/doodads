Doodads::Application.routes.draw do
  root 'splash#index'

  resources :apps, only: [:index, :create, :show] do
    post :follow, on: :member
    get :search, on: :collection
  end

  resources :users

  resource :session, only: [:new, :create, :destroy]
end