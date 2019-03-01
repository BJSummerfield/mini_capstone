Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/product" => "products#id"
    get "/all_products" => "products#all_products"
    get "/product/:id" => "products#id"
    post 'body_params' => 'products#guess'
  end
end
