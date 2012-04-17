Glushkovainna::Application.routes.draw do
  root to: "landing#index"

  resources :albums, :only => [] do
    resources :photos, :only => [:index]
  end

  namespace :admin do
    root to: "albums#index"

    get    "login",  to: "sessions#new", as: "login"
    post   "login",  to: "sessions#create"
    delete "logout", to: "sessions#destroy", as: "logout"

    resources :albums do
      resources :photos do
        collection { post :sort }
      end
    end
  end
end
