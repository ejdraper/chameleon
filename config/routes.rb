Rails.application.routes.draw do
  match "widgets/:id", :to => "widgets#show"
end
