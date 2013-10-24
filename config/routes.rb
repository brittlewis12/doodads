Doodads::Application.routes.draw do
  root 'splash#index'

  resources :apps, only: [:index, :create, :show] do
    get :search, on: :collection
    member do
      post :follow
      resources :doodads, only: [:index, :new, :create, :show]
    end
  end

  resources :users

  resource :session, only: [:new, :create, :destroy]
end