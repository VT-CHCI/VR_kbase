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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140326135706) do

  create_table "aural_fidelities", :force => true do |t|
    t.string   "component"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "author_papers", :force => true do |t|
    t.integer  "author_id"
    t.integer  "paper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "order"
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

  create_table "biomechanical_symmetries", :force => true do |t|
    t.string   "component"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "task_category"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "validated",     :default => false, :null => false
  end

  create_table "control_symmetries", :force => true do |t|
    t.string   "component"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
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
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "experiment_aurals", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "aural_fidelity_id"
    t.string   "desc"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "experiment_aurals", ["aural_fidelity_id"], :name => "index_experiment_aurals_on_aural_fidelity_id"
  add_index "experiment_aurals", ["experiment_id"], :name => "index_experiment_aurals_on_experiment_id"

  create_table "experiment_biomechanicals", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "biomechanical_symmetry_id"
    t.string   "desc"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "experiment_biomechanicals", ["biomechanical_symmetry_id"], :name => "index_experiment_biomechanicals_on_biomechanical_symmetry_id"
  add_index "experiment_biomechanicals", ["experiment_id"], :name => "index_experiment_biomechanicals_on_experiment_id"

  create_table "experiment_controls", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "control_symmetry_id"
    t.string   "desc"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "experiment_controls", ["control_symmetry_id"], :name => "index_experiment_controls_on_control_symmetry_id"
  add_index "experiment_controls", ["experiment_id"], :name => "index_experiment_controls_on_experiment_id"

  create_table "experiment_displays", :force => true do |t|
    t.integer  "display_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "desc"
  end

  add_index "experiment_displays", ["display_id"], :name => "index_experiment_displays_on_display_id"
  add_index "experiment_displays", ["experiment_id"], :name => "index_experiment_displays_on_experiment_id"

  create_table "experiment_haptics", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "haptic_fidelity_id"
    t.string   "desc"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "experiment_haptics", ["experiment_id"], :name => "index_experiment_haptics_on_experiment_id"
  add_index "experiment_haptics", ["haptic_fidelity_id"], :name => "index_experiment_haptics_on_haptic_fidelity_id"

  create_table "experiment_hardwares", :force => true do |t|
    t.integer  "hardware_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "desc"
  end

  add_index "experiment_hardwares", ["experiment_id"], :name => "index_experiment_hardwares_on_experiment_id"
  add_index "experiment_hardwares", ["hardware_id"], :name => "index_experiment_hardwares_on_hardware_id"

  create_table "experiment_indy_variables", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "indy_variable_id"
    t.string   "desc"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "experiment_indy_variables", ["experiment_id"], :name => "index_experiment_indy_variables_on_experiment_id"
  add_index "experiment_indy_variables", ["indy_variable_id"], :name => "index_experiment_indy_variables_on_indy_variable_id"

  create_table "experiment_softwares", :force => true do |t|
    t.integer  "software_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "experiment_softwares", ["experiment_id"], :name => "index_experiment_softwares_on_experiment_id"
  add_index "experiment_softwares", ["software_id"], :name => "index_experiment_softwares_on_software_id"

  create_table "experiment_system_apps", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "system_appropriateness_id"
    t.string   "desc"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "experiment_system_apps", ["experiment_id"], :name => "index_experiment_system_apps_on_experiment_id"
  add_index "experiment_system_apps", ["system_appropriateness_id"], :name => "index_experiment_system_apps_on_system_appropriateness_id"

  create_table "experiment_visuals", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "visual_fidelity_id"
    t.string   "desc"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "experiment_visuals", ["experiment_id"], :name => "index_experiment_visuals_on_experiment_id"
  add_index "experiment_visuals", ["visual_fidelity_id"], :name => "index_experiment_visuals_on_visual_fidelity_id"

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

  create_table "findings", :force => true do |t|
    t.integer  "task_id"
    t.integer  "metric_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "summary"
    t.text     "issue"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "relationship_id"
    t.integer  "specificity_id"
    t.string   "finding_note"
  end

  add_index "findings", ["category_id"], :name => "index_findings_on_category_id"
  add_index "findings", ["metric_id"], :name => "index_findings_on_metric_id"
  add_index "findings", ["task_id"], :name => "index_findings_on_task_id"

  create_table "genders", :force => true do |t|
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "haptic_fidelities", :force => true do |t|
    t.string   "component"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "hardwares", :force => true do |t|
    t.string   "hardware"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "indy_variables", :force => true do |t|
    t.string   "variable"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "metrics", :force => true do |t|
    t.string   "metric"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "paper_venues", :force => true do |t|
    t.integer  "venue_id"
    t.integer  "paper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "paper_venues", ["paper_id"], :name => "index_paper_venues_on_paper_id"
  add_index "paper_venues", ["venue_id"], :name => "index_paper_venues_on_venue_id"

  create_table "papers", :force => true do |t|
    t.string   "title"
    t.date     "year"
    t.integer  "volume"
    t.integer  "end_page"
    t.integer  "start_page"
    t.string   "doi"
    t.string   "paper_url"
    t.integer  "num_views"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "issue"
    t.boolean  "validated",  :default => false, :null => false
    t.boolean  "published",  :default => false, :null => false
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
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "specificities", :force => true do |t|
    t.string   "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "system_appropriatenesses", :force => true do |t|
    t.string   "component"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

  create_table "task_categories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "task_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "task_categories", ["category_id"], :name => "index_task_categories_on_category_id"
  add_index "task_categories", ["task_id"], :name => "index_task_categories_on_task_id"

  create_table "task_metrics", :force => true do |t|
    t.integer  "metric_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "desc"
  end

  add_index "task_metrics", ["metric_id"], :name => "index_task_metrics_on_metric_id"
  add_index "task_metrics", ["task_id"], :name => "index_task_metrics_on_task_id"

  create_table "tasks", :force => true do |t|
    t.integer  "experiment_id"
    t.string   "title"
    t.text     "task_desc"
    t.text     "interface_desc"
    t.text     "env_desc"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "dimension_id"
    t.integer  "scale_id"
    t.integer  "density_id"
    t.integer  "realism_id"
  end

  add_index "tasks", ["experiment_id"], :name => "index_tasks_on_experiment_id"

  create_table "user_authors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_authors", ["author_id"], :name => "index_user_authors_on_author_id"
  add_index "user_authors", ["user_id"], :name => "index_user_authors_on_user_id"

  create_table "user_papers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "paper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_papers", ["paper_id"], :name => "index_user_papers_on_paper_id"
  add_index "user_papers", ["user_id"], :name => "index_user_papers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "accronym"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "visual_fidelities", :force => true do |t|
    t.string   "component"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "validated",  :default => false, :null => false
  end

end
