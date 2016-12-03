class CreateStatuts < ActiveRecord::Migration[5.0]
  def change
    create_table :statuts do |t|
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
