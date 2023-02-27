require "./app/models/payment_providers/payment_provider"
require "./app/models/payment_providers/adyen/adyen_payment_event"

class AdyenPaymentProvider < PaymentProvider
  def payment_authorized(metadata) # in theory we don't need the whole metdata object, Webhook controller will only pass what's needed
    payment_id = metadata[:external_id]
    payment_event =
      PaymentEvent.create(
        event_type: "authorized",
        provider: "adyen",
        payment_id: payment_id
      )
    AdyenPaymentEvent.create(
      metadata: metadata,
      payment_event_id: payment_event.id
    )
  end

  def capture(last_authorization_event)
    puts "capturing with Adyen"

    adyen_event =
      AdyenPaymentEvent.find_by(payment_event_id: last_authorization_event.id)

    puts "capturing the following authorization: #{adyen_event.metadata["authorization_id"]}"
    # HTTP call to Adyen to capture authorization_id
    puts "captured"
    true
  end

  def metadata(payment_event_id)
    puts "getting metadata for payment_event_id: #{payment_event_id}"
    AdyenPaymentEvent.find_by(payment_event_id: payment_event_id.to_i).metadata
  end
end
