require 'test_helper'

feature 'As an artist, I want to be able to CRUD artworks on my campaign' do
  scenario 'after having set up a campaign, create first artwork listing' do
    sign_in(:pepart)

    # create a campaign
    # make pepart current user signed in with a patient campaign alread
    # set up but no artworks.
    page.text.must_include('Hello, Pepart')
    page.text.must_include('You have no current artworks.')


  end

  scenario 'after having set up first artwork, can create another' do
    sign_in(:pepart)

    # create a campaign
    # make pepart current user signed in with a patient campaign alread
    # set up, with one artwork created.
    page.text.must_not_include('You have no current artworks.')
  end

end
