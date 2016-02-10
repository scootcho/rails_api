class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :license_type
      t.string :license_number
      t.string :license_address
      t.string :license_zipcode
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :licenses, :companies
  end
end
