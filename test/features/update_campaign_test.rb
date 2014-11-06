require 'test_helper'

feature 'update a campaign' do
  scenario 'update successfully' do
    sign_in(:pepart)
    visit edit_campaign_path users(:pepart).campaign

    find('#campaign_patient_diagnosis').value.must_equal 'looks pretty disheveled'
    fill_in 'campaign_patient_diagnosis', with: 'looks awful!'

    click_on 'Submit Campaign'

    page.must_have_content 'looks awful!'
    page.wont_have_content 'looks pretty disheveled'
    page.must_have_content 'Your updates were saved successfully.'
    page.wont_have_content 'Error saving Campaign changes. Please try again.'
  end

  scenario 'fails to update campaign because of invalid data' do
    sign_in(:pepart)
    visit edit_campaign_path users(:pepart).campaign

    find('#campaign_patient_diagnosis').value.must_equal 'looks pretty disheveled'
    fill_in 'campaign_patient_diagnosis', with: ''
    click_on 'Submit Campaign'

    page.must_have_content 'Error saving Campaign changes. Please try again.'
  end
end
