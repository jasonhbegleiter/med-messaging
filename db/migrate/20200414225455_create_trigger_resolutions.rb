class CreateTriggerResolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :trigger_resolutions do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.text :type

      t.timestamps
    end
  end
end
