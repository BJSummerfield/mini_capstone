class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id],
      instock: true
      )
    @product.save!
    
    image = ImageUrl.new(
      url: params[:url],
      product_id: @product.id
      )
    image.save
    redirect_to "/products/#{@product.id}"
  end
end
