Doodads::Application.routes.draw do
  root 'splash#index'

  resources :apps, only [:index, :create, :show] do
    member do
      get 'search'
    end
  end
  # resources :users, only [:new, :create, :show]
end
