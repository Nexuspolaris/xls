# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161212215714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string   "name"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procedures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produits", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "societes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "acronyme"
    t.boolean  "subclass"
  end

  create_table "ss_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_ss_categories_on_category_id", using: :btree
  end

  create_table "statuts", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "closed"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "num"
    t.integer  "societe_id"
    t.datetime "date_creation"
    t.datetime "date_assign"
    t.string   "demandeur"
    t.datetime "date_resolution"
    t.datetime "date_livraison"
    t.string   "description"
    t.integer  "agent_id"
    t.string   "solution"
    t.string   "site"
    t.integer  "ss_categorie_id"
    t.integer  "produit_id"
    t.integer  "statut_id"
    t.integer  "procedure_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "titre"
    t.string   "autre_information"
    t.datetime "autre_date"
    t.datetime "date_pending"
    t.string   "code_pending"
    t.string   "service"
    t.string   "equipe"
    t.index ["agent_id"], name: "index_tickets_on_agent_id", using: :btree
    t.index ["num"], name: "index_tickets_on_num", using: :btree
    t.index ["procedure_id"], name: "index_tickets_on_procedure_id", using: :btree
    t.index ["produit_id"], name: "index_tickets_on_produit_id", using: :btree
    t.index ["societe_id"], name: "index_tickets_on_societe_id", using: :btree
    t.index ["ss_categorie_id"], name: "index_tickets_on_ss_categorie_id", using: :btree
    t.index ["statut_id"], name: "index_tickets_on_statut_id", using: :btree
  end

end
