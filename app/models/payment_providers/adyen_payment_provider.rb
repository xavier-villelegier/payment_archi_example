require "./app/models/payment_providers/payment_provider"

class AdyenPaymentProvider < PaymentProvider
  def received_authorize_event(payment)
    puts "received authorizing with Adyen"
    payment_event =
      payment.payment_events.create(
        event_type: "authorization",
        provider: "adyen"
      )

    # QUESTION: How to avoid duplicating this logic accross all payment providers?
    AdyenPaymentEvent.create(
      metadata: {
        payment_method: {
          last_digit: "4444"
        },
        authorization_id: "123"
      },
      payment_event_id: payment_event.id
    )
  end

  def capture(last_authorization_event)
    puts "capturing with Adyen"

    adyen_event = last_authorization_event.adyen_payment_event
    puts "capturing the following authorization: #{adyen_event.metadata["authorization_id"]}"

    # QUESTION: How to avoid duplicating this logic accross all payment providers?
    last_authorization_event.payment.update(captured_at: Time.now)
    last_authorization_event.payment.payment_events.create(
      event_type: "capture",
      provider: "adyen"
    )

    puts "captured"
  end
end
