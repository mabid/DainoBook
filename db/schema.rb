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

ActiveRecord::Schema.define(:version => 20110619104051) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
  end

  create_table "tags", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "photo_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "phone"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.string   "basic_current_city"
    t.string   "baisc_Info_home_town"
    t.string   "basic_info_gender"
    t.boolean  "basic_info_show_gender_in_profile"
    t.date     "basic_info_birthday"
    t.boolean  "basic_info_show_birthday_in_profile"
    t.string   "basic_info_interested_in"
    t.string   "basic_info_about_me"
    t.string   "relationship_status"
    t.string   "relative_name"
    t.string   "friends"
    t.string   "employer"
    t.string   "college_university"
    t.string   "high_school"
    t.string   "religion"
    t.string   "religion_description"
    t.string   "political_views"
    t.string   "political_views_description"
    t.string   "people_inspired_by"
    t.string   "favorite_quotations"
    t.string   "music"
    t.string   "books"
    t.string   "movies"
    t.string   "television"
    t.string   "games"
    t.string   "sports_played"
    t.string   "favorite_team"
    t.string   "favorite_athletes"
    t.string   "activities"
    t.string   "interests"
    t.string   "im_screen_name"
    t.string   "phones"
    t.string   "address"
    t.string   "city_town"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "website"
  end

end
