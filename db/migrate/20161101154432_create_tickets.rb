class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :num, index: true
      t.integer :societe_id, index: true
      t.datetime :date_creation
      t.datetime :date_assign
      t.string :demandeur
      t.datetime :date_resolution
      t.datetime :date_livraison
      t.string :description
      t.integer :agent_id, index: true
      t.string :solution
      t.string :site
      t.integer :ss_categorie_id, index: true
      t.integer :produit_id, index: true
      t.integer :statut_id, index: true
      t.integer :procedure_id, index: true

      t.timestamps
    end
  end
end
