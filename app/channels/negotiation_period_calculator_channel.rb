class NegotiationPeriodCalculatorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "NegotiationPeriodCalculatorChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
