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
