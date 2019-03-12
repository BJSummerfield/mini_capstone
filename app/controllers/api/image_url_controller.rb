class Api::ImageUrlController < ApplicationController
  
  def index
    @images = ImageUrl.all
    @images = ImageUrl.where("name iLIKE ?", "%#{params[:search]}%") if params[:search]
    @images = @images.order(params[:sort] => params[:sort_order]) if params[:sort] && params[:sort_order]
    render 'index.json.jbuilder'
  end
  
  def show
    the_id = params[:id]
    @image = ImageUrl.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @image = ImageUrl.new(
      url: params[:url],
      product_id: params[:product_id])
    if @image.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def update
    the_id = params[:id]
    @image = ImageUrl.find_by(id: the_id)
    if @image.update(
      url: params[:url] || @image.url,
      product_id: params[:product_id] || @image.product_id)
      render 'show.json.jbuilder'
    else 
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def destroy
    the_id  = params[:id]
    @image = ImageUrl.find_by(id: the_id)
    @image.destroy
    render 'show.json.jbuilder'
  end
end

