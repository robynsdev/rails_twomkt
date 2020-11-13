Stripe.api_key = Rails.application.credentials.dig(:public_key, :secret_key)

# Rails.configuration.stripe = {
#   :publishable_key => ENV['PUBLISHABLE_KEY'],
#   :secret_key      => ENV['SECRET_KEY']
# }


# if Rails.env.production?
#   Stripe.api_key = ENV['STRIPE_API_KEY']
#   STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLIC_KEY'] 
  
# Stripe.api_key = Rails.configuration.stripe[:secret_key]


if Rails.env.production?
  :public_key => ENV['PUBLIC_KEY'],
  :secret_key => ENV['SECRET_KEY']
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
