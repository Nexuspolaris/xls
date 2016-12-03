class AddServiceToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :service, :string
  end
end
