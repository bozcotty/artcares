require 'test_helper'

feature 'See campaigns' do
  scenario 'all users see campaigns from menu' do
    visit campaigns_path

    page.must_have_content 'Pepito Colageno'
    page.must_have_content 'Pepito under the weather'
  end
end
