class AddCompanyToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :company, :string
  end
end
