class Payment < ApplicationRecord
  has_many :payment_events

  def last_authorization_event
    payment_events.where(event_type: "authorization").order(:created_at).last
  end

  def capture
    provider_name = last_authorization_event.provider
    payment_provider = PaymentProviderFactory.get_provider(provider_name)

    success = payment_provider.capture(last_authorization_event)

    if success
      update!(captured_at: Time.now)
      payment_events.create(event_type: "capture", provider: provider_name)
    end
  end
end
