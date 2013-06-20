Crowdfund::Application.routes.draw do
  root  "projects#index"
  get   "projects"     => "projects#index"
  get   "projects/:id" => "projects#show", as: "project"
  get   "projects/:id/edit" => "projects#edit", as: "edit_project"
end
