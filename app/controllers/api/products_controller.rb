class Api::ProductsController < ApplicationController
  def product
    @product = [Product.first]
    render 'product.json.jbuilder'
  end

  def all_products
    @all_products = Product.all
    render 'all_products.json.jbuilder'
  end
end
