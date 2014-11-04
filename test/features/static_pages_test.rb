require 'test_helper'

feature 'Welcome#index page' do
  scenario 'go to Welcome Index at root' do
    visit root_path
    page.text.must_include 'Art discovered and purchased here'
    # page.content.must_include 'btn-artists-join.png'
  end
end
