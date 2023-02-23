class Payment < ApplicationRecord
  has_many :payment_events

  def last_authorization_event
    payment_events.where(event_type: "authorization").last
  end

  def capture
    provider = last_authorization_event.provider
    payment_provider = PaymentProviderFactory.get_provider(provider)

    success = payment_provider.capture(last_authorization_event)

    if success
      update!(captured_at: Time.now)
      payment_events.create(event_type: "capture", provider: provider)
    end
  end
end
