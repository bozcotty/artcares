require 'coveralls'
Coveralls.wear!('rails')

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'capybara/poltergeist'

module ActiveSupport
  class TestCase
    fixtures :all
    Capybara.javascript_driver = :poltergeist
  end
end

def sign_in(fixture_name)
  visit new_user_session_path
  fill_in 'Email', with: users(fixture_name).email
  fill_in 'Password', with: '12345678'
  click_on 'Sign in'
end

def create_artwork(fixture_name)
  fill_in 'artwork_title', with: artworks(fixture_name).title
  fill_in 'artwork_size', with: artworks(fixture_name).size
  check('artwork_original_work')
  select('sculpture', from: 'artwork_category')
  fill_in 'artwork_medium', with: artworks(fixture_name).medium
  fill_in 'artwork_price', with: artworks(fixture_name).price
  fill_in 'artwork_shipping_price', with: artworks(fixture_name).shipping_price
  fill_in 'artwork_summary', with: artworks(fixture_name).summary
  click_on 'List Artwork'
end
