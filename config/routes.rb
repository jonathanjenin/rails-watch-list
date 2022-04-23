Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create]
  resources :bookmarks, only: [:index, :show, :new, :create, :destroy]
end
