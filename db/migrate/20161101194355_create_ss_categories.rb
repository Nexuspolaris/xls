class CreateSsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :ss_categories do |t|
      t.string :name
      t.integer :categorie_id
      t.string :type

      t.timestamps
    end
  end
end
