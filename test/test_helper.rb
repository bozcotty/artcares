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
  visit welcome_dashboard

  fill_in "Name your Patient Campaign, (i.e. 'Art for Mary\'s Cancer Fund'", with:

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


