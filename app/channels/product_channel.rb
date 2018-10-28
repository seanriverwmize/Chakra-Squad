class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    def listen(data)
      stop_all_streams
      stream_for data["product_id"]
    end
  end
end
