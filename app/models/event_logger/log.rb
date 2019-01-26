module EventLogger
  class Log < ApplicationRecord
    belongs_to :event_type
    has_many :events
    belongs_to :log_host

    def has_error?
      events.select{|event| event.status == "error"}.present?
    end

    class << self
      def search(params={})
        includes(:events, :event_type, :log_host)
          .by_dates(params[:dates])
          .by_host(params[:host])
          .by_event_name(params[:event_name])
          .by_event_status(params[:event_status]).distinct
      end

      def by_dates(dates)
        if dates.present?
          start_date = Date.parse(dates[:start_date])
          end_date = Date.parse(dates[:end_date])
          where('event_logger_logs.created_at' => start_date.beginning_of_day..end_date.end_of_day)
        else
          all
        end
      end

      def by_host(host)
        host.present? ? where('event_logger_log_host.host' => host) : all
      end

      def by_event_status(key)
        key.present? ? where('event_logger_events.status' => key) : all
      end

      def by_event_name(event_name)
        event_name.present? ? where('event_logger_event_types.name' => event_name) : all
      end
    end
  end
end
