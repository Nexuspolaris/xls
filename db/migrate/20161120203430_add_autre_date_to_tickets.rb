class AddAutreDateToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :autre_date, :datetime
  end
end
