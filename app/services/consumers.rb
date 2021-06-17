class Consumers

  def self.subscribe
    ArticleConsumer.subscribe
    UserConsumer.subscribe
  end

end