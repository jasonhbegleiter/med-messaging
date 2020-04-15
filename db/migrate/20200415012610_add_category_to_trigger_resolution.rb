class AddCategoryToTriggerResolution < ActiveRecord::Migration[6.0]
  def change
    add_column :trigger_resolutions, :category, :text
  end
end
