class Api::ProductsController < ApplicationController
  def product
    @product = [Product.first]
    render 'product.json.jbuilder'
  end

  def all_products
    @all_products = Product.all
    render 'all_products.json.jbuilder'
  end

  def id
    idnum = params[:id]
    @product = Product.find_by! id: idnum
    render 'productid.json.jbuilder'
  end

  @@answer = Array(1..20)
  @@range = @@answer[rand(@@answer.last)]
  def guess
    @message = "Guess a number #{@@answer.first} - #{@@answer.last}"
    if
      @guess = params[:guess]
      guess = @guess.to_i
      if guess < @@answer.first || guess > @@answer.last
        @message = "Please guess a number in the range of #{@@answer.first} - #{@@answer.last}"
      elsif guess == @@range
        @win = "You win!"
      elsif guess > @@range
        @win = "guess lower"
      elsif guess < @@range
        @win = "guess higher"
      end
    end
    render 'guess.json.jbuilder' 
  end
end
