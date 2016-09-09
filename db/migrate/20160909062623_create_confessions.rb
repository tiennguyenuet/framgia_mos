class CreateConfessions < ActiveRecord::Migration
  def change
    create_table :confessions do |t|
      t.text :content
      t.integer :status

      t.timestamps null: false
    end
  end
end
