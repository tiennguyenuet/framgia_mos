class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :image
      t.string :audio
      t.integer :user_id
      t.integer :category_id
      t.integer :status, default: 0
      t.integer :post_type
      t.string :accepted_by
      t.timestamps null: false
    end
  end
end
