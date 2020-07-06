class ChangeColumnNameB < ActiveRecord::Migration[6.0]
  def change
    rename_column :armors, :type, :armor_type
  end
end
