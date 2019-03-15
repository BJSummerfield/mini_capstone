class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @order = Order.find_by(id: the_id)
    render 'show.json.jbuilder'
  end  
  
  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity])
      @order.subtotal = Product.find(@order.product_id).price * @order.quantity
      @order.tax = 1.09
      @order.total =(@order.subtotal * @order.tax)
      if @order.save
        render 'show.json.jbuilder'
      else
        render 'errors.json.jbuilder', status: :unprocessible_entity
      end
  end
end
