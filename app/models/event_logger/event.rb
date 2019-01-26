module EventLogger
  class Event < ApplicationRecord
    belongs_to :log
    enum :status => [:error, :success]
  end
end
