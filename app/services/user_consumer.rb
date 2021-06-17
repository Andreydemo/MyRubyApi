class UserConsumer

  def self.subscribe
    # grab the fanout exchange
    x = channel.queue("blog.user", durable: true)
    begin
      x.subscribe() do |_delivery_info, _properties, event_body|
        puts " [x] #{_properties} #{event_body}"
        user =  (JSON.parse event_body)["payload"]
        article = Article.new(title: user["firstName"], body: user["email"])
        article.save
      end
    rescue Interrupt => _
      channel.close
    end
  end

  def self.channel
    @channel ||= Connection.connection.create_channel
  end

end