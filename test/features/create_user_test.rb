require 'test_helper'

feature 'sign up a new user' do
  scenario 'create new user successfully in the database' do
    visit root_path
    click_on 'Sign In'
    click_on '... or Sign up'
    page.must_have_content 'Sign Up Here!'

    # When I fill the registration form
    fill_in 'Email', with: 'choni@hola.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password Confirmation', with: '12345678'
    fill_in 'First Name', with: 'choni'
    fill_in 'Last Name', with: 'smith'

    fill_in 'Street Address', with: '132 jsdhkahsd'
    fill_in 'Apt/Unit #', with: '8'
    fill_in 'City', with: 'Seattle'

    fill_in 'State', with: 'WA'
    fill_in 'Zip Code', with: '98102'
    fill_in 'Phone Number', with: '2066542377'
    fill_in 'Your Art Website URL', with: 'www.choni.com'
    select 'Painter', from: 'Type of Artist'
    fill_in 'Narrative', with: 'xxx'

    click_on 'Create Account'

    # Then I become a registered user and are logged in
    page.must_have_content 'A message with a confirmation link has been sent to your email address.'
    page.must_have_content 'Please open the link to activate your account.'

    # And automatically I become an author
    User.order(:created_at).last.email.must_equal 'choni@hola.com'
  end

  scenario 'fail to create an invalid user' do
    visit root_path
    click_on 'Sign In'
    click_on '... or Sign up'

    fill_in 'Email', with: 'jaime@hola.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password Confirmation', with: '12345678'
    click_on 'Create Account'

    page.wont_have_content 'A message with a confirmation link has been sent to your email address.'
    page.wont_have_content 'Please open the link to activate your account.'
    User.order(:created_at).last.email.wont_equal 'jaime@hola.com'
  end
end

feature 'login and out users' do
  scenario 'sign in a user without a campaign' do
    sign_in(:pepe)
    page.text.must_include 'Hello, Pepe'
    page.text.must_include 'Pepe Smith - Artist\'s Dashboard'
    page.text.must_include 'Please start a Campaign'
  end

  scenario 'sign in a user with a campaign but no artworks' do
    sign_in(:pepart)
    page.must_have_content 'Pepito under the weather'
    page.must_have_content 'You have no current artworks'
  end

  # scenario 'sign in a user with a campaign and artworks' do
  #   sign_in(:pepart)
  #   page.text.must_include 'Pepe Smith - Artist\'s Dashboard'
  #   page.text.must_include 'Please start a Campaign'
  # end

  scenario 'sign out a user' do
    sign_in(:pepe)
    click_on 'Log out'
    page.must_have_content 'Signed out successfully.'
  end
end
