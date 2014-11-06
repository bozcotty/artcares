require 'test_helper'

feature 'create a new campaign' do
  scenario 'create successfully' do
    sign_in(:pepe)
    page.must_have_content 'You have no current Campaign'
    visit new_campaign_path

    fill_in 'campaign_campaign_name', with: 'Mariajo feels sick today'
    fill_in 'campaign_patient_first_name', with: 'Mary'
    fill_in 'campaign_patient_last_name', with: 'Stuart'
    fill_in 'campaign_patient_street_address', with: '232 Yale Ave'
    fill_in 'campaign_patient_unit_number', with: '9'
    fill_in 'campaign_patient_city', with: 'Boston'
    fill_in 'campaign_patient_state', with: 'MA'
    fill_in 'campaign_patient_zip_code', with: '56321'
    fill_in 'campaign_patient_phone_number', with: '8979897766'
    fill_in 'campaign_artist_relationship_to_patient', with: '3rd Aunt from paternal side'
    fill_in 'campaign_patient_diagnosis', with: 'Tunnel Carpal Syndrome'
    fill_in 'campaign_patient_story', with: 'yada yada'
    fill_in 'campaign_artist_percentage', with: '15'

    click_on 'Submit Campaign'

    # Then I become a registered user and are logged in
    page.must_have_content 'The Campaign for Mary'
    page.must_have_content 'Campaign was saved successfully.'
  end

  # scenario 'fail to create an invalid user' do
  #   visit root_path
  #   click_on 'Sign In'
  #   click_on '... or Sign up'

  #   fill_in 'Email', with: 'jaime@hola.com'
  #   fill_in 'Password', with: '12345678'
  #   fill_in 'Password Confirmation', with: '12345678'
  #   click_on 'Create Account'

  #   page.wont_have_content 'A message with a confirmation link has been sent to your email address.'
  #   page.wont_have_content 'Please open the link to activate your account.'
  #   User.order(:created_at).last.email.wont_equal 'jaime@hola.com'
  # end
end
