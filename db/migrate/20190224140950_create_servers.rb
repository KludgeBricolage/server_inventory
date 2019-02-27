class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :host_name
      t.string :model
      t.string :serial_no

      t.timestamps
    end
  end
end
