require 'test_helper'

feature 'As an artist, I want to be able to update artworks on my campaign' do
  scenario 'update a work of art' do
    sign_in(:pepart)
    find('#btn_new_artwk').click
    create_artwork(:one)

    visit dashboard_path
    find_link('Edit').click

    fill_in 'artwork_title', with: 'Void expression of nihilistic numbness'
    click_on 'List Artwork'
    page.text.must_include 'Void expression of nihilistic numbness'
    page.text.wont_include artworks(:one).title
  end

  scenario 'does not update an invalid work of art' do
    sign_in(:pepart)
    find('#btn_new_artwk').click
    create_artwork(:one)

    visit dashboard_path
    find_link('Edit').click

    fill_in 'artwork_title', with: ''
    click_on 'List Artwork'

    page.current_url.must_match /campaigns\/\d+\/artworks\/\d+/
    page.text.must_include 'Title can\'t be blank'
  end
end
