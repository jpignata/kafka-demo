class EventHandler
  def initialize(logger)
    @logger   = logger
    @messages = []
  end

  def fire(event, user, attributes={})
    payload = {
      event:      event,
      timestamp:  Time.now.to_f,
      attributes: attributes,
      user: {
        id:         user.id,
        created_at: user.created_at.to_f
      }
    }

    @messages.push(payload.to_json)
  end

  def flush
    @logger.write(@messages) if @messages.present?
  end
end
