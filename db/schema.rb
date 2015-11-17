# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20_151_115_154_429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'items', force: :cascade do |t|
    t.integer 'sku_id'
    t.integer 'supplier_external_id'
    t.integer 'price_cents'
    t.string 'price_currency', default: 'USD', null: false
    t.datetime 'created_at',                           null: false
    t.datetime 'updated_at',                           null: false
    t.index ['supplier_external_id'], name: 'index_items_on_supplier_external_id', using: :btree
  end

  create_table 'suppliers', force: :cascade do |t|
    t.string 'name'
    t.integer 'external_id', null: false
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['external_id'], name: 'index_suppliers_on_external_id', unique: true, using: :btree
  end

  add_foreign_key 'items', 'suppliers', column: 'supplier_external_id', primary_key: 'external_id'
end
