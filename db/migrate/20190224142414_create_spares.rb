class CreateSpares < ActiveRecord::Migration[5.2]
  def change
    create_table :spares do |t|
      t.string :item_type
      t.string :description
      t.integer :stock
      t.datetime :date_delivered
      t.datetime :date_warranty
      t.float :balance, default: 0.0
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
