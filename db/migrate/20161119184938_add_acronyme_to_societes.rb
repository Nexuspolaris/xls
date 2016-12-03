class AddAcronymeToSocietes < ActiveRecord::Migration[5.0]
  def change
    add_column :societes, :acronyme, :string
  end
end
