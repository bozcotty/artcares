require 'test_helper'

feature 'create a new campaign' do
  scenario 'create successfully' do
    sign_in(:pepart)
    page.must_have_content 'You have no current Campaign'

    create_campaign

    # Then I become a registered user and are logged in
    page.must_have_content 'Fixing Johnny Rotten\'s Stomach'
    page.must_have_content 'Campaign was saved successfully.'
  end
end
