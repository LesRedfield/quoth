class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name, null: false
      t.integer :cost, default: 0

      t.timestamps null: false
    end
  end
end
