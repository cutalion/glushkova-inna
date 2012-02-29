Glushkovainna::Application.routes.draw do
  root to: "landing#index"

  resources :albums, :only => [] do
    resources :photos, :only => [:index]
  end

  namespace :admin do
    root to: "albums#index"

    resources :albums do
      resources :photos
    end
  end
end
