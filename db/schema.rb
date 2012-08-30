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

ActiveRecord::Schema.define(:version => 20120830203930) do

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

  create_table "categories", :force => true do |t|
    t.string   "task_category"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "components", :force => true do |t|
    t.string   "comp_of_immersion"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "densities", :force => true do |t|
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dimensions", :force => true do |t|
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "displays", :force => true do |t|
    t.string   "display"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "experiment_components", :force => true do |t|
    t.integer  "component_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "experiment_components", ["component_id"], :name => "index_experiment_components_on_component_id"
  add_index "experiment_components", ["experiment_id"], :name => "index_experiment_components_on_experiment_id"

  create_table "experiment_displays", :force => true do |t|
    t.integer  "display_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "experiment_displays", ["display_id"], :name => "index_experiment_displays_on_display_id"
  add_index "experiment_displays", ["experiment_id"], :name => "index_experiment_displays_on_experiment_id"

  create_table "experiment_hardwares", :force => true do |t|
    t.integer  "hardware_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "experiment_hardwares", ["experiment_id"], :name => "index_experiment_hardwares_on_experiment_id"
  add_index "experiment_hardwares", ["hardware_id"], :name => "index_experiment_hardwares_on_hardware_id"

  create_table "experiment_softwares", :force => true do |t|
    t.integer  "software_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "experiment_softwares", ["experiment_id"], :name => "index_experiment_softwares_on_experiment_id"
  add_index "experiment_softwares", ["software_id"], :name => "index_experiment_softwares_on_software_id"

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
    t.integer  "gender_id"
    t.text     "display_desc"
  end

  add_index "experiments", ["paper_id"], :name => "index_experiments_on_paper_id"

  create_table "finding_components", :force => true do |t|
    t.integer  "finding_id"
    t.integer  "component_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "finding_components", ["component_id"], :name => "index_finding_components_on_component_id"
  add_index "finding_components", ["finding_id"], :name => "index_finding_components_on_finding_id"

  create_table "finding_relationships", :force => true do |t|
    t.integer  "relationship_id"
    t.integer  "finding_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "finding_relationships", ["finding_id"], :name => "index_finding_relationships_on_finding_id"
  add_index "finding_relationships", ["relationship_id"], :name => "index_finding_relationships_on_relationship_id"

  create_table "findings", :force => true do |t|
    t.integer  "task_id"
    t.integer  "metric_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "summary"
    t.text     "issue"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "findings", ["category_id"], :name => "index_findings_on_category_id"
  add_index "findings", ["metric_id"], :name => "index_findings_on_metric_id"
  add_index "findings", ["task_id"], :name => "index_findings_on_task_id"

  create_table "genders", :force => true do |t|
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hardwares", :force => true do |t|
    t.string   "hardware"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "metrics", :force => true do |t|
    t.string   "metric"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "papers", :force => true do |t|
    t.string   "title"
    t.date     "year"
    t.integer  "volume"
    t.integer  "end_page"
    t.integer  "start_page"
    t.string   "doi"
    t.string   "paper_url"
    t.integer  "num_views"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "issue"
  end

  create_table "realisms", :force => true do |t|
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.string   "relationship"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "scales", :force => true do |t|
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "softwares", :force => true do |t|
    t.string   "software"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "task_categories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "task_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "task_categories", ["category_id"], :name => "index_task_categories_on_category_id"
  add_index "task_categories", ["task_id"], :name => "index_task_categories_on_task_id"

  create_table "task_densities", :force => true do |t|
    t.integer  "density_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "task_densities", ["density_id"], :name => "index_task_densities_on_density_id"
  add_index "task_densities", ["task_id"], :name => "index_task_densities_on_task_id"

  create_table "task_dimensions", :force => true do |t|
    t.integer  "dimension_id"
    t.integer  "task_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "task_dimensions", ["dimension_id"], :name => "index_task_dimensions_on_dimension_id"
  add_index "task_dimensions", ["task_id"], :name => "index_task_dimensions_on_task_id"

  create_table "task_metrics", :force => true do |t|
    t.integer  "metric_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "task_metrics", ["metric_id"], :name => "index_task_metrics_on_metric_id"
  add_index "task_metrics", ["task_id"], :name => "index_task_metrics_on_task_id"

  create_table "task_realisms", :force => true do |t|
    t.integer  "realism_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "task_realisms", ["realism_id"], :name => "index_task_realisms_on_realism_id"
  add_index "task_realisms", ["task_id"], :name => "index_task_realisms_on_task_id"

  create_table "task_scales", :force => true do |t|
    t.integer  "scale_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "task_scales", ["scale_id"], :name => "index_task_scales_on_scale_id"
  add_index "task_scales", ["task_id"], :name => "index_task_scales_on_task_id"

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
    t.integer  "paper_id"
  end

end
