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
