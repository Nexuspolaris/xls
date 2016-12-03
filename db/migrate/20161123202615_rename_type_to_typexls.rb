class RenameTypeToTypexls < ActiveRecord::Migration[5.0]
  def change
    rename_column :ss_categories, :type, :typexls
  end
end
