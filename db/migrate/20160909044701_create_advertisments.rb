class CreateAdvertisments < ActiveRecord::Migration
  def change
    create_table :advertisments do |t|
      t.string :image
      t.string :description
      t.string :url

      t.timestamps null: false
    end
  end
end
