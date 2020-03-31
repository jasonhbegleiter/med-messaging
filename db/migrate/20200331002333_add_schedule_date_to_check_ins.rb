class AddScheduleDateToCheckIns < ActiveRecord::Migration[6.0]
  def change
    add_column :check_ins, :scheduled_date, :date
    remove_column :check_ins, :completed
  end
end
