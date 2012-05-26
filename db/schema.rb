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

ActiveRecord::Schema.define(:version => 20120411103548) do

  create_table "admin_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "choices", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "category_name"
    t.string   "name"
    t.integer  "user_id"
    t.string   "help_text"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "test_id"
    t.integer  "user_id"
    t.string   "question"
    t.string   "type_of_question"
    t.string   "correct_answer"
    t.string   "help_text"
    t.integer  "num_of_answers"
    t.integer  "sort_order"
    t.text     "validation"
    t.integer  "size"
    t.string   "tags"
    t.string   "difficulty_level"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "responses", :force => true do |t|
    t.integer  "test_id"
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "selected_answer"
    t.boolean  "is_correct"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "no_of_attempts"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "samgruffs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tests", :force => true do |t|
    t.integer  "user_id"
    t.string   "code"
    t.string   "name"
    t.integer  "category_id"
    t.string   "help_text"
    t.integer  "no_of_questions"
    t.string   "state",           :default => "inactive"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                                              :null => false
    t.string   "last_name",                                               :null => false
    t.integer  "phone_number",        :limit => 8
    t.boolean  "is_admin",                         :default => false
    t.integer  "role_id"
    t.integer  "created_user_id"
    t.string   "state",                            :default => "pending"
    t.string   "email",                                                   :null => false
    t.string   "crypted_password",                                        :null => false
    t.string   "password_salt",                                           :null => false
    t.string   "persistence_token",                                       :null => false
    t.string   "single_access_token",                                     :null => false
    t.string   "perishable_token",                                        :null => false
    t.integer  "login_count",                      :default => 0,         :null => false
    t.integer  "failed_login_count",               :default => 0,         :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

end
