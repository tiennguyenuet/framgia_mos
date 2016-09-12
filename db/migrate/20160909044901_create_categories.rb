class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :code
      t.string :parent_code

      t.timestamps null: false
    end
  end
end
