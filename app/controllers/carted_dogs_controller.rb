class CartedDogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.cart.any?
      @carted_dogs = current_user.cart
    else
      flash[:warning] = "Your shopping cart is empty."
      redirect_to '/'
    end
  end

  def create
    @carted_dog = CartedDog.new(
                                        user_id: current_user.id,
                                        dog_id: params[:dog_id],
                                        quantity: params[:quantity],
                                        status: "carted"
                                        )
    if @carted_dog.save
      redirect_to "/carted_dogs"
    else
      flash[:warning] = "Please Enter a Quantity"
      redirect_to "/#{params[:dog_id]}"
    end
  end


  def destroy
    carted_dog = CartedDog.find(params[:id]) 
    carted_dog.update(status: 'removed')
    flash[:success] = 'Product removed from cart'
    redirect_to '/carted_dogs'
  end
end