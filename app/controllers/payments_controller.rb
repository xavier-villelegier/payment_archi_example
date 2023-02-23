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
    payment_provider.received_authorize_event(payment)
  end

  def capture
    payment = Payment.find(params[:id])
    payment.capture
  end
end
