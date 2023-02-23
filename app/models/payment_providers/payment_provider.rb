class PaymentProvider
  def authorize
    raise NotImplementedError
  end

  def capture
    raise NotImplementedError
  end
end
