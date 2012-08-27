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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120827013118) do

  create_table "author_papers", :force => true do |t|
    t.integer  "author_id"
    t.integer  "paper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "author_papers", ["author_id"], :name => "index_author_papers_on_author_id"
  add_index "author_papers", ["paper_id"], :name => "index_author_papers_on_paper_id"

  create_table "authors", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "experiments", :force => true do |t|
    t.integer  "paper_id"
    t.string   "title"
    t.text     "exp_desc"
    t.integer  "part_num"
    t.integer  "part_age_min"
    t.integer  "part_age_max"
    t.text     "part_background"
    t.text     "system_desc"
    t.text     "other_vars"
    t.text     "constants"
    t.text     "comp_desc"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "experiments", ["paper_id"], :name => "index_experiments_on_paper_id"

  create_table "papers", :force => true do |t|
    t.string   "title"
    t.date     "year"
    t.integer  "volume"
    t.integer  "num_pages"
    t.integer  "start_page"
    t.string   "doi"
    t.string   "paper_url"
    t.integer  "num_views"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "experiment_id"
    t.string   "title"
    t.text     "task_desc"
    t.text     "interface_desc"
    t.text     "env_desc"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "tasks", ["experiment_id"], :name => "index_tasks_on_experiment_id"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "accronym"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
