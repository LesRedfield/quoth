class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name, null: false
      t.string :city
      t.integer :state_id, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end

    add_index :quotes, :state_id
  end
end
