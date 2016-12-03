class AddAutreInformationToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :autre_information, :string
  end
end
