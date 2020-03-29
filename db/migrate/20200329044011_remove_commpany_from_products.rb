class RemoveCommpanyFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :commpany
  end
end
