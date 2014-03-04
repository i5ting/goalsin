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

ActiveRecord::Schema.define(version: 20140202124100) do

  create_table "backbones", force: true do |t|
    t.string   "name"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.boolean  "editable"
    t.boolean  "checkable"
    t.boolean  "is_show_icon"
    t.boolean  "is_show_line"
    t.boolean  "is_show_title"
    t.boolean  "is_expand_all"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.text     "detail"
    t.integer  "pid"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.string   "ancestry"
  end

  add_index "sections", ["ancestry"], name: "index_sections_on_ancestry"
  add_index "sections", ["project_id"], name: "index_sections_on_project_id"

  create_table "tests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
