class RemoveCategorieIdfromSsCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :ss_categories, :categorie_id
  end
end
