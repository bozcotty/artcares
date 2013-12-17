Rails.configuration.stripe = {
  # :publishable_key => ENV['PUBLISHABLE_KEY'],
  # :secret_key      => ENV['SECRET_KEY']
  :publishable_key => pk_foo,
  :secret_key => sk_bar
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]