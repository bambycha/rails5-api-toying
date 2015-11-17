class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :sku_id
      t.integer :supplier_external_id, index: true
      t.monetize :price, amount: { null: true, default: nil }

      t.timestamps
    end

    add_foreign_key :items, :suppliers, column: :supplier_external_id, primary_key: :external_id
  end
end
