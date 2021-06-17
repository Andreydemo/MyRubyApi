class Connection

  def self.connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end


end