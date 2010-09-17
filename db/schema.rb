# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100703202939) do

  create_table "actions", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "action"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", :force => true do |t|
    t.integer  "transform_id"
    t.integer  "action_id"
    t.integer  "format_id"
    t.string   "before"
    t.string   "after"
    t.string   "match"
    t.string   "contain"
    t.string   "conditional"
    t.string   "type"
    t.string   "position"
    t.string   "column_name"
    t.string   "when"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
