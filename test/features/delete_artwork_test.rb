require 'test_helper'

feature 'As an artist, I want to be able to remove artworks from my campaign' do
  scenario 'delete artwork listing' do
    sign_in(:pepart)
    find('#btn_new_artwk').click
    create_artwork(:one)

    visit dashboard_path
    find_link('Delete').click

    page.text.must_include 'was deleted successfully'
  end
end
