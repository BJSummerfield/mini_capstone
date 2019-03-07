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
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image_url: params[:image_url],
      instock: params[:instock]
      )
    @product.save
    render 'show.json.jbuilder'
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    @product.update(
      name: params[:name] || @product.name,
      description: params[:description] || @product.description,
      price: params[:price] || @product.price,
      image_url: params[:image_url] || @product.image_url,
      instock: params[:instock] || @product.instock
      )
    render 'show.json.jbuilder'
  end

  def destroy
    the_id  = params[:id]
    @product = Product.find_by(id: the_id)
    @product.destroy
    render 'show.json.jbuilder'
  end
end
