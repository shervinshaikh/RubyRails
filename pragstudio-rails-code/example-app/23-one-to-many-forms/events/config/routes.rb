Events::Application.routes.draw do
  root "events#index"

  resources :events do
    resources :registrations
  end
end
