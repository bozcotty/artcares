require 'test_helper'

feature 'As an artist, I want to be able to CRUD artworks on my campaign' do
  scenario 'after having set up a campaign, create first artwork listing' do

    sign_in(:pepart)
    # make pepart current user signed in with a patient campaign alread
    # set up but no artworks.
    page.text.must_include('Hello, Pepart')
    page.text.must_include('You have no current artworks.')
  end
end
