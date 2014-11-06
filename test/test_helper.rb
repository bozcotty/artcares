require 'coveralls'
Coveralls.wear!('rails')

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'capybara/poltergeist'
# require 'pry-rescue/minitest'

class ActiveSupport::TestCase
  fixtures :all
  Capybara.javascript_driver = :poltergeist
end

def sign_in(fixture_name)
  visit new_user_session_path

  fill_in 'Email', with: users(fixture_name).email
  fill_in 'Password', with: '12345678'
  click_on 'Sign in'
end


def create_campaign
  visit new_campaign_path

  fill_in 'campaign_campaign_name', with: campaigns(:one).campaign_name
  fill_in 'campaign_patient_first_name', with: campaigns(:one).patient_first_name
  fill_in 'campaign_patient_last_name', with: campaigns(:one).patient_last_name
  fill_in 'campaign_patient_street_address', with: campaigns(:one).patient_street_address
  fill_in 'campaign_patient_unit_number', with: campaigns(:one).patient_unit_number
  fill_in 'campaign_patient_city', with: campaigns(:one).patient_city
  fill_in 'campaign_patient_state', with: campaigns(:one).patient_state
  fill_in 'campaign_patient_zip_code', with: campaigns(:one).patient_zip_code
  fill_in 'campaign_patient_phone_number', with: campaigns(:one).patient_phone_number
  fill_in 'campaign_artist_relationship_to_patient', with: campaigns(:one).artist_relationship_to_patient
  fill_in 'campaign_patient_diagnosis', with: campaigns(:one).patient_diagnosis
  fill_in 'campaign_patient_story', with: campaigns(:one).patient_story
  fill_in 'campaign_artist_percentage', with: campaigns(:one).artist_percentage
  click_on 'Submit Campaign'
end

def create_artwork
  visit new_campaign_artwork_path

  fill_in 'Title of Artwork', with: artworks(:one).title
  fill_in 'Dimensions/Size', with: artworks(:one).size
  check('Verify this is an original Artwork by checking the box.')
  select('sculpture', :from => 'Art Category')
  fill_in 'Medium (i.e. oil, acrylic, watercolor. etc.)', with: artworks(:one).medium
  fill_in 'Price (US $)', with: artworks(:one).price
  fill_in 'Shipping & Handling Cost (US $)', with: artworks(:one).shipping_price
  click_on 'List Artwork'
end


