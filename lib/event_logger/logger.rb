module EventLogger
  class Logger

    def log(host, event_type, *args)
      messages = []
      caught_exception = nil
      begin
        yield(messages) if block_given?
      rescue Exception => e
        caught_exception = e
        raise e
      ensure
        create_log(host: host, 
          event_type: event_type, 
          messages: messages, 
          exception: caught_exception)
      end
    end

  private

    def create_log(log_information)
      event_type = EventType.find_or_create_by(name: log_information[:event_type])
      host = LogHost.find_or_create_by(name: log_information[:host])
      log = Log.create(log_host: host, event_type: event_type)
      create_events(log, log_information[:messages], log_information[:exception]) 
    end

    def create_events(log, messages, exception)
      messages = normalize_messages(messages)
      messages.each do |message|
        log.events.success.create(:message => message)
      end
      unless exception.nil?
        parsed_backtrace = parse_exception_backtrace(exception.backtrace)
        message = "Exception in #{parsed_backtrace[:file]} in the line number #{parsed_backtrace[:line_number]} in method #{parsed_backtrace[:where]}: #{exception.message.to_s}"
        log.events.error.create(message: message)
      end
    end

    def normalize_messages(messages)
      messages.map(&:to_s)
    end

    def parse_exception_backtrace(backtrace)
      backtrace.first.match(/^(.+?):(\d+)(|:in `(.+)')$/)
      {:file => $1, :line_number => $2, :where => $3}
    end
  end
end