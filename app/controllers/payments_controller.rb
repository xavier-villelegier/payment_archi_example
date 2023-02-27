require "./app/models/payment_providers/payment_provider_factory"

class PaymentsController < ApplicationController
  def show
    @payment = Payment.find(params[:id])
  end

  # Emulate AUTHORIZATION webbook
  def authorize
    payment_provider_param = params[:provider]
    payment = Payment.find(params[:id])
    payment_provider =
      PaymentProviderFactory.get_provider(payment_provider_param)

    # Mock webhook calls
    payment_provider.payment_authorized(
      { external_id: payment.id, payment_method: { last_digit: "4444" } }
    )
  end

  def capture
    payment = Payment.find(params[:id])
    payment.capture
  end
end
