class AddTitreToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :titre, :string
  end
end
