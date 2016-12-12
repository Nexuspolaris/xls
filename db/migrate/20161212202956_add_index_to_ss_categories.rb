class AddIndexToSsCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :ss_categories, :category_id, :integer
    add_index :ss_categories, :category_id
  end
end
