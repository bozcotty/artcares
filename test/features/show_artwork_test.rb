require 'test_helper'

feature 'As an artist, I want to be able to see the details of my listed artwork' do
  scenario 'after listing artwork, it should be viewable in my listings' do
    sign_in(:pepart)
    find('#btn_new_artwk').click
    create_artwork(:one)
    visit dashboard_path
    find('#btn_new_artwk').click
    create_artwork(:two)
    click_on 'Log out'

    visit campaigns_path
    click_on 'Pepito Colageno'

    find('.center-div').all('a').last.click
    page.text.must_include 'by Pepart Artsmith for Pepito Colageno'
  end
end
