class AddTypexlsToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :typexls, :integer
  end
end
