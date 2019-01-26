module EventLogger
  class LogsController < ApplicationController
    before_action :set_events
    
    def index
      @logs = Log.search(search_params)
                 .order('event_logger_logs.created_at DESC')
                 .paginate(page: params[:page])
    end

    private

    def search_params
      search_params = {
        event_name: params[:event_name],
        host: params[:host],
        event_status: params[:event_status]
      }
      if params[:start_date].present? && params[:end_date].present?
        search_params.merge!({dates: {start_date: params[:start_date], end_date: params[:end_date]}})
      end
      search_params
    end

    def set_events
      @event_types = EventType.all
      @hosts = LogHost.all
    end
  end
end