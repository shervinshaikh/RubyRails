Crowdfund::Application.routes.draw do
  resources :pledges

  root  "projects#index"
  resources :projects
end
