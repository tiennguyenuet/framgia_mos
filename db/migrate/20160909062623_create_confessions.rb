class CreateConfessions < ActiveRecord::Migration
  def change
    create_table :confessions do |t|
      t.text :content
      t.string :admin_comment
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
