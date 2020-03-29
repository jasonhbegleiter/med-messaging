class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :commpany
      t.string :medium_type
      t.decimal :unit

      t.timestamps
    end
  end
end
