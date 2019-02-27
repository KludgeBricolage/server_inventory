class CreateSpares < ActiveRecord::Migration[5.2]
  def change
    create_table :spares do |t|
      t.string :description
      t.datetime :date_delivered
      t.datetime :date_warranty
      t.integer :stock
      t.float :balance, default: 0.0

      t.timestamps
    end
  end
end
