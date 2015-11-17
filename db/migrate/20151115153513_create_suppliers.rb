class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :external_id, null: false

      t.timestamps
    end

    add_index :suppliers, :external_id, unique: true
  end
end
