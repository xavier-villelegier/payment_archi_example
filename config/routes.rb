Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/payments/:id", to: "payments#show"
  post "/payments/:id/authorize", to: "payments#authorize"
  post "/payments/:id/capture", to: "payments#capture"
end
