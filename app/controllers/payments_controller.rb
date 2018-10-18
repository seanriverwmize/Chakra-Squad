class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @price = @product.price * 100
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      logger.debug "Creating payment with Stripe..."
      logger.debug "Price of payment: #{@product.price}"

      charge = Stripe::Charge.create(
        amount: @price, # amount in cents, again
        currency: "usd",
        source: token,
        description: params[:stripeEmail]
      )

      if charge.paid
        logger.debug "Charge was paid."
        Order.create(product_id: @product.id, user_id: @user, total: @product.price)
      end
    rescue Stripe::CardError => e
      # The card has been declined
      logger.debug "Charge was not paid; the card was declined."
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to payments_payment_made_path
  end
end
