Events::Application.routes.draw do
  get "events"     => "events#index"
  get "events/:id" => "events#show"
end
