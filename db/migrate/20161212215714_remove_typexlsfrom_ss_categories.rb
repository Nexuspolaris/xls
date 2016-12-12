class RemoveTypexlsfromSsCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :ss_categories, :typexls
  end
end
