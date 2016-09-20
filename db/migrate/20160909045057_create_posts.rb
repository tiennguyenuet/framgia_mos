class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :image
      t.string :audio
      t.integer :user_id
      t.integer :category_id
      t.integer :status, default: 0
      t.integer :post_type

      t.timestamps null: false
    end
  end
end
