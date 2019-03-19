Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    get '/suppliers' => 'suppliers#index'
    get '/suppliers/:id' => 'suppliers#show'
    post '/suppliers' => 'suppliers#create'
    patch '/suppliers/:id' => 'suppliers#update'
    delete '/suppliers/:id' => 'suppliers#destroy'

    get '/image_url' => 'image_url#index'
    get '/image_url/:id' => 'image_url#show'
    post '/image_url' => 'image_url#create'
    patch '/image_url/:id' => 'image_url#update'
    delete '/image_url/:id' => 'image_url#destroy'

    post 'users' => "users#create"

    post "/sessions" => "sessions#create"
    
    get "orders/:id" => "orders#show"
    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
  end
end
