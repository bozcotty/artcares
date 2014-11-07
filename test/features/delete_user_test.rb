require 'test_helper'

feature 'delete user' do
  scenario 'delete' do
    sign_in(:pepart)
    visit dashboard_path

    find('#btn_edit_usr').click

    click_on('Cancel my account')
    page.text.must_include 'Your account was successfully cancelled'
  end
end
