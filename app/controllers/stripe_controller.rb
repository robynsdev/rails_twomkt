class StripeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def checkout

      session = Stripe::Checkout::Session.create({
          payment_method_types: ['card'],
          line_items: [{
          price_data: {
              currency: 'usd',
              product_data: {
              name: 'T-shirt',
              },
              unit_amount: 2000,
          },
          quantity: 1,
          }],
          mode: 'payment',
          # For now leave these URLs as placeholder values.
          #
          # Later on in the guide, you'll create a real success page, but no need to
          # do it yet.
          success_url: successful_checkout_url,
          cancel_url: "#{home_index_url}",
      })

      render json: { id: session.id }
  end

  def new
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
