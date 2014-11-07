require 'test_helper'

feature 'As an artist, I want to be able to create artworks on my campaign' do
  scenario 'after having set up a campaign, create first artwork listing' do
    sign_in(:pepart)
    find('#btn_new_artwk').click

    create_artwork(:one)

    page.text.must_include('Your artwork listing was saved successfully.')
    page.text.wont_include('You have no current artworks.')
    page.text.must_include('Pepito Colageno')
    page.text.must_include('looks pretty disheveled')
  end

  scenario 'after having set up first artwork, can create another' do
    sign_in(:pepart)
    find('#btn_new_artwk').click
    create_artwork(:one)

    visit dashboard_path
    find('#btn_new_artwk').click
    create_artwork(:two)

    page.text.must_include('Your artwork listing was saved successfully.')
    page.text.must_include('Pepito Colageno')
  end

  scenario 'does not create an invalid artwork' do
    sign_in(:pepart)
    find('#btn_new_artwk').click

    fill_in 'artwork_title', with: artworks(:one).title
    fill_in 'artwork_size', with: artworks(:one).size
    check('artwork_original_work')
    click_on 'List Artwork'

    page.current_url.must_match /campaigns\/\d+\/artworks/
    page.text.must_include 'can\'t be blank'
  end
end
