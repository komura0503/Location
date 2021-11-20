class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :caption
      t.string :image_id, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
