class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :host_name
      t.integer :machine_model, null: false
      t.string :operating_system
      t.string :role
      t.string :project
      t.datetime :date_warranty
      
      t.timestamps
    end
  end
end
