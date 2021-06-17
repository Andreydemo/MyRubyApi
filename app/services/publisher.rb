class Publisher
  # In order to publish message we need a exchange name.
  # Note that RabbitMQ does not care about the payload -
  # we will be using JSON-encoded strings
  def self.publish(exchange, message = {})
    # grab the fanout exchange
    x = channel.direct("blog.#{exchange}", durable: true )
    # and simply publish message
    x.publish(message.to_json)
  end

  def self.channel
    @channel ||= Connection.connection.create_channel
  end

end