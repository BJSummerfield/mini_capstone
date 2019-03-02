Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get 'products' => 'products#index'
    get 'products/:id' => 'products#show'
    post 'products' => 'products#create'
    patch ' recipies/:id' => 'recipes#update'
    delete '/recipes/:id' => 'recipes#destroy'
  end
end
