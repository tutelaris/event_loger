class CreateEventLoggerEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :event_logger_events do |t|
      t.integer :log_id
      t.text :message
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
