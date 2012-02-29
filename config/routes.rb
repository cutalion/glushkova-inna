Glushkovainna::Application.routes.draw do
  root to: "landing#index"

  resources :albums, :only => [] do
    resources :photos, :only => [:index]
  end

  namespace :admin do
    root to: "photos#index"

    resources :photos
  end
end
