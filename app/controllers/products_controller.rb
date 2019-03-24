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

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    @product.supplier_id = params[:supplier_id]
    image = ImageUrl.find_by(product_id: @product.id)
    image.url = params[:image_url]
    @product.save!
    image.save

    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"
  end

end
