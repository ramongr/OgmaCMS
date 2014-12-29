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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20141205160355) do
=======
ActiveRecord::Schema.define(version: 20141222105909) do
>>>>>>> develop

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "attachments", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "description"
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  add_index "attachments", ["created_by_id"], name: "index_attachments_on_created_by_id", using: :btree
  add_index "attachments", ["updated_by_id"], name: "index_attachments_on_updated_by_id", using: :btree

  create_table "attendings", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "going",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.boolean  "notification", default: true
=======
    t.boolean  "notification",             default: true
>>>>>>> develop
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "categorizable_id"
    t.string   "categorizable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "created_by_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["created_by_id"], name: "index_comments_on_created_by_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "body"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.boolean  "publish",                   default: false
  end

  add_index "events", ["created_by_id"], name: "index_events_on_created_by_id", using: :btree
  add_index "events", ["updated_by_id"], name: "index_events_on_updated_by_id", using: :btree

  create_table "forem_categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true, using: :btree

  create_table "forem_forums", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count",             default: 0
    t.string  "slug",        limit: 255
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true, using: :btree

  create_table "forem_groups", force: :cascade do |t|
    t.string "name", limit: 255
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name", using: :btree

  create_table "forem_memberships", force: :cascade do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id", using: :btree

  create_table "forem_moderator_groups", force: :cascade do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id", using: :btree

  create_table "forem_posts", force: :cascade do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       limit: 255, default: "pending_review"
    t.boolean  "notified",                default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id", using: :btree
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state", using: :btree
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id", using: :btree
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id", using: :btree

  create_table "forem_subscriptions", force: :cascade do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: :cascade do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",                   default: false,            null: false
    t.boolean  "pinned",                   default: false
    t.boolean  "hidden",                   default: false
    t.datetime "last_post_at"
    t.string   "state",        limit: 255, default: "pending_review"
    t.integer  "views_count",              default: 0
    t.string   "slug",         limit: 255
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id", using: :btree
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true, using: :btree
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state", using: :btree
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id", using: :btree

  create_table "forem_views", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",                         default: 0
    t.string   "viewable_type",     limit: 255
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at", using: :btree
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id", using: :btree
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.boolean  "publish",                   default: false
  end

  add_index "galleries", ["created_by_id"], name: "index_galleries_on_created_by_id", using: :btree
  add_index "galleries", ["updated_by_id"], name: "index_galleries_on_updated_by_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",      limit: 255
    t.integer  "type_mask"
  end

  create_table "links_sidebars", force: :cascade do |t|
    t.integer "link_id"
    t.integer "sidebar_id"
  end

  create_table "newsletter_translations", force: :cascade do |t|
    t.integer  "newsletter_id",             null: false
    t.string   "locale",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject",       limit: 255
    t.text     "body"
    t.string   "name",          limit: 255
  end

  add_index "newsletter_translations", ["locale"], name: "index_newsletter_translations_on_locale", using: :btree
  add_index "newsletter_translations", ["newsletter_id"], name: "index_newsletter_translations_on_newsletter_id", using: :btree

  create_table "newsletters", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject",       limit: 255
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  add_index "newsletters", ["created_by_id"], name: "index_newsletters_on_created_by_id", using: :btree
  add_index "newsletters", ["updated_by_id"], name: "index_newsletters_on_updated_by_id", using: :btree

  create_table "newsletters_users", force: :cascade do |t|
    t.integer "newsletter_id"
    t.integer "user_id"
  end

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id",                null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",      limit: 255
    t.text     "body"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "slug",          limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.boolean  "publish",    default: false
=======
    t.boolean  "publish",                   default: false
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
>>>>>>> develop
  end

  add_index "pages", ["created_by_id"], name: "index_pages_on_created_by_id", using: :btree
  add_index "pages", ["updated_by_id"], name: "index_pages_on_updated_by_id", using: :btree

  create_table "pages_sidebars", force: :cascade do |t|
    t.integer "sidebar_id"
    t.integer "page_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type", limit: 255
    t.integer  "attachment_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["attachment_id"], name: "index_photos_on_attachment_id", using: :btree
  add_index "photos", ["imageable_id", "imageable_type"], name: "index_photos_on_imageable_id_and_imageable_type", using: :btree

  create_table "post_translations", force: :cascade do |t|
    t.integer  "post_id",                null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",      limit: 255
    t.text     "content"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "content"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.boolean  "publish",    default: false
=======
    t.boolean  "publish",                   default: false
    t.integer  "updated_by_id"
>>>>>>> develop
  end

  add_index "posts", ["created_by_id"], name: "index_posts_on_created_by_id", using: :btree
  add_index "posts", ["updated_by_id"], name: "index_posts_on_updated_by_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255, null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "sidebars", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.integer  "type_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.boolean  "publish",                   default: false
  end

  add_index "sidebars", ["created_by_id"], name: "index_sidebars_on_created_by_id", using: :btree
  add_index "sidebars", ["updated_by_id"], name: "index_sidebars_on_updated_by_id", using: :btree

  create_table "sliders", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.boolean  "selected"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.boolean  "publish",                   default: false
  end

  add_index "sliders", ["created_by_id"], name: "index_sliders_on_created_by_id", using: :btree
  add_index "sliders", ["updated_by_id"], name: "index_sliders_on_updated_by_id", using: :btree

  create_table "system_mail_translations", force: :cascade do |t|
    t.integer  "system_mail_id",             null: false
    t.string   "locale",         limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",           limit: 255
    t.string   "subject",        limit: 255
    t.text     "content"
  end

  add_index "system_mail_translations", ["locale"], name: "index_system_mail_translations_on_locale", using: :btree
  add_index "system_mail_translations", ["system_mail_id"], name: "index_system_mail_translations_on_system_mail_id", using: :btree

  create_table "system_mails", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "subject",    limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "action",     limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",               null: false
    t.string   "encrypted_password",     limit: 255, default: "",               null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "forem_admin",                        default: false
    t.string   "forem_state",            limit: 255, default: "pending_review"
    t.boolean  "forem_auto_subscribe",               default: false
    t.string   "role",                   limit: 255, default: "registered"
    t.string   "name",                   limit: 255
    t.date     "dob"
    t.string   "country",                limit: 255
    t.string   "gender",                 limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "language",               limit: 255
    t.string   "unsubscribe_token",      limit: 255
    t.boolean  "newsletter_subscribed",              default: false
    t.string   "time_zone",              limit: 255
    t.date     "registration_due_date"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unsubscribe_token"], name: "index_users_on_unsubscribe_token", unique: true, using: :btree

  create_table "visitor_comments", force: :cascade do |t|
    t.string   "subject",       limit: 255
    t.text     "content"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visitor_comments", ["created_by_id"], name: "index_visitor_comments_on_created_by_id", using: :btree

end
