class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    @suppliers = Supplier.where("name iLIKE ?", "%#{params[:search]}%") if params[:search]
    @suppliers = @suppliers.order(params[:sort] => params[:sort_order]) if params[:sort] && params[:sort_order]
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @supplier = Supplier.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email])
    if @supplier.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def update
    the_id = params[:id]
    @supplier = Supplier.find_by(id: the_id)
    if @supplier.update(
      name: params[:name] || @supplier.name,
      phone_number: params[:phone_number] || @supplier.phone_number,
      email: params[:email] || @supplier.email)
      render 'show.json.jbuilder' 
    else 
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def destroy
    the_id  = params[:id]
    @supplier = Supplier.find_by(id: the_id)
    @supplier.destroy
    render 'show.json.jbuilder'
  end
end