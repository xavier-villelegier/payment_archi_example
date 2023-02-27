require "./app/models/payment_providers/payment_provider_factory"

class PaymentEvent < ApplicationRecord
  belongs_to :payment

  # No has_one: adyen_payment_event, stripe_payment_event, etc. to isolate things

  # QUESTION: How to get the good xxx_payment_event metadata without Payment class being aware of provider-specific classes ?
  # answer: factory because we know the provider
  def provider_metadata
    payment_provider = PaymentProviderFactory.get_provider(provider)
    payment_provider.metadata(id)
  end
end
