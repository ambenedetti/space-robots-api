class ChangeColumnNameA < ActiveRecord::Migration[6.0]
  def change
    rename_column :weapons, :type, :weapon_type
  end
end
