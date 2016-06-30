Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:new, :create, :destroy]

  #resources :band, only: [:show, :update, :destroy, :edit, :new]
  resources :bands, only: [:index, :create, :new, :update, :destroy, :edit, :new] do
    resources :albums, only: [:new], on: :member
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

end
