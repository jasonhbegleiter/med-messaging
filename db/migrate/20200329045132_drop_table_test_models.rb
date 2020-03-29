class DropTableTestModels < ActiveRecord::Migration[6.0]
  def change
    drop_table :test_models
  end
end
