class CreateRobots < ActiveRecord::Migration[6.0]
  def change
    create_table :robots do |t|
      t.string :type
      t.string :name
      t.string :serial_number

      t.timestamps
    end
  end
end
