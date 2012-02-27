Glushkovainna::Application.routes.draw do
  root to: "landing#index"

  namespace :admin do
    root to: "photos#index"

    resources :photos
  end
end
