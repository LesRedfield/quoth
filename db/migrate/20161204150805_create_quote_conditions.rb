class CreateQuoteConditions < ActiveRecord::Migration
  def change
    create_table :quote_conditions do |t|
      t.integer :quote_id, null: false
      t.integer :condition_id, null: false

      t.timestamps null: false
    end

    add_index :quote_conditions, :quote_id
    add_index :quote_conditions, :condition_id
  end
end
