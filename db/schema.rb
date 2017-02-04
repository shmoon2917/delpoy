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

ActiveRecord::Schema.define(version: 20170204145827) do

  create_table "apply_list_details", force: :cascade do |t|
    t.integer  "id_of_mentor"
    t.integer  "user_id"
    t.integer  "auction_price"
    t.integer  "complete"
    t.string   "title"
    t.string   "mentor_area"
    t.string   "from"
    t.string   "to"
    t.integer  "numOfMem"
    t.string   "themeOfPlan"
    t.integer  "budget"
    t.text     "mentor_content"
    t.text     "accomodation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "mentor_id"
    t.integer  "chat_room_id"
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "index_of_applies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "mentor_id"
    t.integer  "list_id"
    t.integer  "complete"
    t.integer  "auction_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string   "area"
    t.string   "period"
    t.text     "content"
    t.integer  "personal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "real_mentors", force: :cascade do |t|
    t.string   "area"
    t.string   "period"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "grade"
    t.string   "region"
    t.string   "phone"
    t.integer  "gender"
    t.integer  "language"
    t.string   "user_img_url"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email"
    t.index ["gender"], name: "index_users_on_gender"
    t.index ["grade"], name: "index_users_on_grade"
    t.index ["language"], name: "index_users_on_language"
    t.index ["name"], name: "index_users_on_name"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["region"], name: "index_users_on_region"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_img_url"], name: "index_users_on_user_img_url"
    t.index ["username"], name: "index_users_on_username"
  end

end
