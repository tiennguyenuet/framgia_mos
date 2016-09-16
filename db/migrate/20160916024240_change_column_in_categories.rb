class ChangeColumnInCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :parent_id, :integer
    remove_column :categories, :parent_code
    remove_column :categories, :code
  end
end
