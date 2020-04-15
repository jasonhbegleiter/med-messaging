class ChangeColumnNameType < ActiveRecord::Migration[6.0]
  def change
    rename_column :trigger_resolutions, :type, :item_type
  end
end
