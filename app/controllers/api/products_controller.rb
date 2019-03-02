class Api::ProductsController < ApplicationController
  
  def index
    @product = Product.all
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      description: params[:input_description],
      price: params[:input_price],
      image_url: params[:input_image_url]
      )
    render 'show.json.jbuilder'
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    @product.update(
      name: params[:input_name],
      description: params[:input_description],
      price: params[:input_price],
      image_url: params[:input_image_url]
      )
    render 'show.json.jbuilder'
  end

  def destroy
    the_id  = params[:id]
    @product = Product.find_by(id: the_id)
    @product.destroy
    reder 'show.json.jbuilder'
  end
end
