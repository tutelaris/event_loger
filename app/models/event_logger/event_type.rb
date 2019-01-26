module EventLogger
  class EventType < ApplicationRecord
    has_many :logs
  end
end
