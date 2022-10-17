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


  namespace :api do
    resource :books, only: [:index] do
      collection do
        get 'search'
        get 'year'
      end
    end
    resource :authors, only: [:index] do
      collection do
        get 'search'
      end
    end
  end

  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
