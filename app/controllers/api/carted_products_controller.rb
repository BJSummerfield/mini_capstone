class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jbuilder'
  end



  def create
  @carted_product = CartedProduct.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    status: "carted"
    )
    if @carted_product.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end
end
