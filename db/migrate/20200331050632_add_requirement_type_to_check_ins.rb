class AddRequirementTypeToCheckIns < ActiveRecord::Migration[6.0]
  def change
    add_column :check_ins, :requirement_type, :string
  end
end
