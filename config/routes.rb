Doodads::Application.routes.draw do
  root 'splash#index'

  resources :apps, only: [:index, :create, :show] do
    get :search, on: :collection
    member do
      post :follow
      resources :doodads, except: [:edit, :update, :destroy]
    end
  end

  resources :users

  resource :session, only: [:new, :create, :destroy]
end