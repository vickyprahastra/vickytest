Rails.application.routes.draw do

  resources :authors do
    collection do
      get :retrieve
    end
  end

  resources :books do
    collection do
      get :retrieve
    end
  end

  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
