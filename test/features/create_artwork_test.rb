require 'test_helper'

feature 'As an artist, I want to be able to CRUD artworks on my campaign' do
  scenario 'after having set up a campaign, create first artwork listing' do
    sign_in(:pepart)
    find('#btn_new_artwk').click

    fill_in 'artwork_title', with: artworks(:one).title
    fill_in 'artwork_size', with: artworks(:one).size
    check('artwork_original_work')
    select('sculpture', from: 'artwork_category')
    fill_in 'artwork_medium', with: artworks(:one).medium
    fill_in 'artwork_price', with: artworks(:one).price
    fill_in 'artwork_shipping_price', with: artworks(:one).shipping_price
    fill_in 'artwork_summary', with: artworks(:one).summary
    click_on 'List Artwork'

    page.text.must_include('Your artwork listing was saved successfully.')
    page.text.must_include('Pepito Colageno')
    page.text.must_include('looks pretty disheveled')
  end

  # scenario 'after having set up first artwork, can create another' do
  #   sign_in(:pepart)

  #   # create a campaign
  #   # make pepart current user signed in with a patient campaign alread
  #   # set up, with one artwork created.
  #   page.text.must_not_include('You have no current artworks.')
  # end
end
