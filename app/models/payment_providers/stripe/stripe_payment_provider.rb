require "./app/models/payment_providers/payment_provider"

class StripePaymentProvider < PaymentProvider
  def received_authorize_event(payment_id)
    puts "authorizing with Stripe"
  end

  def capture
    puts "capturing with Stripe"
  end
end
