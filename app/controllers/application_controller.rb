require "ostruct"

class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :flush_events_to_log

  private

  def event_handler
    @event_handler ||= EventHandler.new(KafkaLog.instance)
  end

  def flush_events_to_log
    event_handler.flush
  end

  # Dummy user for demonstration purposes.
  def current_user
    OpenStruct.new(
      id: 1,
      created_at: Time.at(1343613040.0148852)
    )
  end
end
