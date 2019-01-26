module EventLogger
  class LogHost < ApplicationRecord
    has_many :logs
  end
end
