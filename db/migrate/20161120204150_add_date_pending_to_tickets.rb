class AddDatePendingToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :date_pending, :datetime
  end
end
