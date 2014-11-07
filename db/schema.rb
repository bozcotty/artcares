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

ActiveRecord::Schema.define(version: 20_141_106_011_057) do

  create_table 'artworks', force: true do |t|
    t.string 'title'
    t.string 'size'
    t.string 'medium'
    t.float 'price'
    t.float 'shipping_price'
    t.text 'summary'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.string 'art_image_1'
    t.string 'art_image_2'
    t.string 'art_image_3'
    t.integer 'user_id'
    t.integer 'campaign_id'
    t.boolean 'original_work'
    t.string 'category'
    t.string 'status'
    t.integer 'quantity'
  end

  add_index 'artworks', ['campaign_id'], name: 'index_artworks_on_campaign_id'

  create_table 'buyers', force: true do |t|
    t.string 'name'
    t.datetime 'created_at',                    null: false
    t.datetime 'updated_at',                    null: false
    t.string 'address_line_1'
    t.string 'address_zip'
    t.string 'address_city'
    t.string 'address_state'
    t.string 'address_country'
    t.string 'address_country_code'
    t.string 'shipping_name'
    t.string 'shipping_address_line_1'
    t.string 'shipping_address_zip'
    t.string 'shipping_address_city'
    t.string 'shipping_address_state'
    t.string 'shipping_address_country'
    t.string 'shipping_address_country_code'
    t.string 'address_apartment'
    t.string 'shipping_address_apartment'
    t.string 'email'
  end

  create_table 'campaigns', force: true do |t|
    t.string 'patient_city'
    t.string 'patient_state'
    t.string 'artist_relationship_to_patient'
    t.string 'patient_diagnosis'
    t.text 'patient_story'
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.string 'patient_image_1'
    t.integer 'user_id'
    t.string 'patient_first_name'
    t.string 'patient_last_name'
    t.string 'campaign_name'
    t.string 'patient_street_address'
    t.string 'patient_unit_number'
    t.string 'patient_zip_code'
    t.string 'patient_phone_number'
    t.integer 'artist_percentage'
  end

  create_table 'pg_search_documents', force: true do |t|
    t.text 'content'
    t.integer 'searchable_id'
    t.string 'searchable_type'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
  end

  create_table 'users', force: true do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'art_website'
    t.string 'type_of_artist'
    t.text 'artist_statement'
    t.string 'email',                  default: '', null: false
    t.string 'encrypted_password',     default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count',          default: 0,  null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at',                             null: false
    t.datetime 'updated_at',                             null: false
    t.string 'city'
    t.string 'state'
    t.string 'role'
    t.string 'headshot'
    t.string 'street_address'
    t.string 'unit_number'
    t.string 'phone_number'
    t.string 'zip_code'
    t.string 'provider'
    t.string 'uid'
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true

end
