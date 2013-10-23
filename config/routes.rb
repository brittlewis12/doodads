Doodads::Application.routes.draw do
  root 'splash#index'

  resources :apps, only: [:index, :create, :show] do
    collection do
      get 'search'
    end
  end

  resources :users

  resources :session, only: [:new, :create, :destroy]
end