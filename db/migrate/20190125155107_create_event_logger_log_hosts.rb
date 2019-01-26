class CreateEventLoggerLogHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :event_logger_log_hosts do |t|
      t.string :name

      t.timestamps
    end
  end
end
