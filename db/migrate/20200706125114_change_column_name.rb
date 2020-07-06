class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :robots, :type, :robot_type
  end
end
