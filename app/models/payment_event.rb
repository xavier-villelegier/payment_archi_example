class PaymentEvent < ApplicationRecord
  belongs_to :payment

  # QUESTION: How to get the good xxx_payment_event metadata without Payment class being aware of provider-specific classes ?
  has_one :stripe_payment_event, required: false
  has_one :adyen_payment_event, required: false

  def provider_metadata
    if stripe_payment_event
      stripe_payment_event.metadata
    elsif adyen_payment_event
      adyen_payment_event.metadata
    else
      {}
    end
  end
end
