class OrdersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  require 'Braintree'


TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
    @carted_dogs = current_user.cart
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    @carted_dogs.update_all(status: "purchased")
    if result.success? || result.transaction
      # redirect_to checkout_path(result.transaction.id)
      flash[:success] = "Your order has been placed!"
      redirect_to '/'
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to '/orders'
    end
  end

  # def new
  #   @client_token = Braintree::ClientToken.generate
  # end

  # # def create
  # #   carted_dogs = current_user.cart
  # #   order = Order.create(user_id: current_user.id)
  # #   carted_dogs.update_all(status: 'purchased', order_id: order.id)
  # #   order.calculate_totals
  # #   if order.save
  # #     redirect_to "/orders/#{order.id}"
  # #   end
  # # end


  #   def create
  #   nonce = params[:payment_method_nonce]
  #   count = @count
  #   received = Braintree::Transaction.sale(
  #     amount: count,
  #     payment_method_nonce: nonce
  #   )

  #   flash[:notice] = "Thank you for your order." if received.success?
   
  #   redirect_to '/'
  # end

  # def show
  #   @order = Order.find(params["id"])
  # end
end

