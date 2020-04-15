class RemoveItemTypeFromTriggerResolution < ActiveRecord::Migration[6.0]
  def change

    remove_column :trigger_resolutions, :item_type, :text
  end
end
