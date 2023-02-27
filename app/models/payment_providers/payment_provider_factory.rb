require "./app/models/payment_providers/stripe/stripe_payment_provider"
require "./app/models/payment_providers/adyen/adyen_payment_provider"

class PaymentProviderFactory
  def self.get_provider(provider)
    case provider
    when "stripe"
      StripePaymentProvider.new
    when "adyen"
      AdyenPaymentProvider.new
    else
      raise "Unknown payment provider"
    end
  end
end
