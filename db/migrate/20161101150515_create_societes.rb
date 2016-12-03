class CreateSocietes < ActiveRecord::Migration[5.0]
  def change
    create_table :societes do |t|
      t.string :name

      t.timestamps
    end
  end
end
