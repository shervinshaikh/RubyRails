Crowdfund::Application.routes.draw do
  root  "projects#index"
  resources :projects do
    resources :pledges
  end
end
