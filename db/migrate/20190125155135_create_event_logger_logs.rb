class CreateEventLoggerLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :event_logger_logs do |t|
      t.integer :event_type_id
      t.integer :log_host_id

      t.timestamps
    end
  end
end
