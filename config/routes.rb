Rails.application.routes.draw do
  match "widgets/:id", :to => "chameleon/widgets#show", :via => [:get, :post]
end
