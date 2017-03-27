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

ActiveRecord::Schema.define(version: 20170317110311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", using: :btree
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "floor_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.string   "phone"
    t.string   "email"
    t.time     "deleted_at"
    t.index ["floor_id"], name: "index_companies_on_floor_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",              default: "",    null: false
    t.string   "location",           default: "",    null: false
    t.string   "host"
    t.float    "price",              default: 0.0,   null: false
    t.string   "link"
    t.text     "description"
    t.boolean  "public",             default: false
    t.boolean  "weekly",             default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.time     "deleted_at"
  end

  create_table "floors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.time     "deleted_at"
    t.text     "description"
    t.string   "colour"
    t.integer  "number"
  end

  create_table "logs", force: :cascade do |t|
    t.string   "title",              null: false
    t.date     "date"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.time     "deleted_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["project_id"], name: "index_logs_on_project_id", using: :btree
  end

  create_table "meeting_rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "floor_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "capacity",           default: 1
    t.text     "description"
    t.boolean  "reservable",         default: false
    t.string   "status"
    t.time     "deleted_at"
    t.index ["floor_id"], name: "index_meeting_rooms_on_floor_id", using: :btree
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",               null: false
    t.text     "description",        null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.time     "deleted_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "floor_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "project_type",       null: false
    t.text     "description"
    t.integer  "season_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.time     "deleted_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["season_id"], name: "index_projects_on_season_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "meeting_room_id"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.time     "deleted_at"
    t.text     "note"
    t.index ["meeting_room_id"], name: "index_reservations_on_meeting_room_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "user_id"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.time     "deleted_at"
    t.index ["entity_id", "entity_type"], name: "index_roles_on_entity_id_and_entity_type", using: :btree
    t.index ["user_id"], name: "index_roles_on_user_id", using: :btree
  end

  create_table "room_searches", force: :cascade do |t|
    t.datetime "start_time",  null: false
    t.time     "length_time", null: false
    t.integer  "length",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "program_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time     "deleted_at"
    t.index ["program_id"], name: "index_seasons_on_program_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "first_name",             default: "",         null: false
    t.string   "last_name",              default: "",         null: false
    t.string   "phone"
    t.string   "title"
    t.string   "role",                   default: "inactive"
    t.integer  "company_id"
    t.string   "provider",               default: "email",    null: false
    t.string   "uid",                    default: "",         null: false
    t.json     "tokens"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.time     "deleted_at"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
