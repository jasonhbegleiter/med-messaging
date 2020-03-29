class CreatePrescriptionSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :prescription_schedules do |t|
      t.references :prescription, null: false, foreign_key: true
      t.string :day_of_week
      t.string :time_of_day
      t.boolean :as_needed

      t.timestamps
    end
  end
end
