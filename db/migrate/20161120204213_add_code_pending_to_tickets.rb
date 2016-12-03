class AddCodePendingToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :code_pending, :string
  end
end
