class Api::ProductsController < ApplicationController
  def product
    @product = Product.first
    render 'product.json.jbuilder'
  end
end
