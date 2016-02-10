class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :quantity
      t.string :unit_type

      t.timestamps null: false
    end
  end
end
