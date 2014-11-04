# ENV['RAILS_ENV'] ||= 'test'
Rails.env = 'test'
puts "Current environment: #{Rails.env}"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'
require 'capybara/poltergeist'
# require 'pry-rescue/minitest'

class ActiveSupport::TestCase
  fixtures :all
  Capybara.javascript_driver = :poltergeist
end
