Events::Application.routes.draw do
  root "events#index"
  get "events"     => "events#index"
  get "events/:id" => "events#show", as: "event"
end
