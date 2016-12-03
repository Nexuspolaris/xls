class AddSubclassToSocietes < ActiveRecord::Migration[5.0]
  def change
    add_column :societes, :subclass, :bool
  end
end
