class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.integer :post_id, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      
      t.timestamps
    end
  end
end
