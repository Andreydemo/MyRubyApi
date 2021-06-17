class ArticleConsumer

  def self.subscribe
    # grab the fanout exchange
    x = channel.queue("blog.article", durable: true)
    begin
      x.subscribe() do |_delivery_info, _properties, body|
        puts " [x] #{_properties} #{body}"
      end
    rescue Interrupt => _
      channel.close
    end
  end

  def self.channel
    @channel ||= Connection.connection.create_channel
  end


end