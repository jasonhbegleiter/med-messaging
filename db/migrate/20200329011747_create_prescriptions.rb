class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :amount
      t.string :instructions
      t.date :start_date
      t.date :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
