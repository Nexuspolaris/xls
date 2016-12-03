class AddClosedTostatuts < ActiveRecord::Migration[5.0]
  def change
    add_column :statuts, :closed, :bool
  end
end
