require 'test_helper'

feature 'create a new campaign' do
  scenario 'create successfully' do
    sign_in(:pepe)
    page.must_have_content 'You have no current Campaign'

    click_on 'Start a Campaign'

    fill_in 'Name your Campaign', with: 'Mary\'s Health Fund'
    fill_in 'First Name of Patient', with: 'Mary'
    fill_in 'Last Name of Patient', with: 'Stuart'
    fill_in 'Street Address', with: '232 Yale Ave'
    fill_in 'Apt/Unit #', with: '9'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Zip Code', with: '56321'
    fill_in 'Phone Number', with: '8979897766'
    fill_in 'This person\'s relationship to you', with: '3rd Aunt from paternal side'
    fill_in ' Name the Patient\'s condition', with: 'Tunnel Carpal Syndrome'
    fill_in 'Tell a brief, descriptive and compelling story', with: ''
    fill_in 'What percentage', with: '15'

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
