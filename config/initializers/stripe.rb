# Stripe.api_key = Rails.application.credentials.dig(:public_key, :secret_key)


Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.stripe[:stripe_publishable_key],    
  :secret_key => Rails.application.credentials.stripe[:stripe_secret_key]    
}    
Stripe.api_key = Rails.application.credentials.stripe[:stripe_secret_key]