Rails::Application.routes.draw do
  match "widgets/:id", :to => "widgets#show"
end
