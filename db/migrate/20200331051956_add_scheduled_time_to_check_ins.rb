class AddScheduledTimeToCheckIns < ActiveRecord::Migration[6.0]
  def change
    add_column :check_ins, :scheduled_time, :string
  end
end
