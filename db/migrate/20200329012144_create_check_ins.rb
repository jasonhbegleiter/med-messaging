class CreateCheckIns < ActiveRecord::Migration[6.0]
  def change
    create_table :check_ins do |t|
      t.references :prescription_schedule, null: false, foreign_key: true
      t.boolean :completed
      t.date :completed_timestamp
      t.string :status

      t.timestamps
    end
  end
end
