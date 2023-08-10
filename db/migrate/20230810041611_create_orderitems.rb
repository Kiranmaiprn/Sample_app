class CreateOrderitems < ActiveRecord::Migration[7.0]
  def change
    create_table :orderitems do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
