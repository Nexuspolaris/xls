class AddPrevuToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :prevu, :string
  end
end
