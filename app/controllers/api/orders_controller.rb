class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      # subtotal: (Product.find_by(id: params[:product_id])* params[:quantity]),
      # tax: params[:tax],
      # total: params[:total]
      # )
    @order
    if @order.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end
end
