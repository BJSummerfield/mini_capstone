class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only:[:create, :update, :destroy]


  def index
    @products = Product.all
    @products = Product.where("name iLIKE ?", "%#{params[:search]}%") if params[:search]
    @products = Product.where("price < 50") if params[:discount] == "true"
    @products = @products.order(params[:sort] => params[:sort_order]) if params[:sort] && params[:sort_order]
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
      supplier_id: params[:supplier_id],
      instock: params[:instock]
      )
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    if @product.update(
      name: params[:name] || @product.name,
      description: params[:description] || @product.description,
      price: params[:price] || @product.price,
      supplier_id: params[:supplier_id] || @product.supplier_id,
      instock: params[:instock] || @product.instock
      )
      render 'show.json.jbuilder' 
    else 
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def destroy
    the_id  = params[:id]
    @product = Product.find_by(id: the_id)
    @product.destroy
    render 'show.json.jbuilder'
  end
end
