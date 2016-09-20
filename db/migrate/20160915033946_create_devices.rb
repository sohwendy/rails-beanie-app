class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :operating_system
      t.string :users, array: true, default: []
      t.string :udid
      t.date :purchase_date
      t.attachment :photo

      t.timestamps
    end
  end
end
