require 'test_helper'

feature 'Visit major site pages and view/welcome folder' do
  scenario 'go to Welcome Index at root' do
    visit root_path
    page.text.must_include 'Art discovered and purchased here'
    page.must_have_link(:"Contact Us", :href => '/messages/new')
  end

  scenario 'visit "About Us" page' do
    visit welcome_about_path
    page.text.must_include 'So, how did this all begin?'
    page.must_have_link(:"Contact Us", :href => '/messages/new')
  end

  scenario 'visit "Artists Join Us" page' do
    visit welcome_artists_join_us_path
    page.text.must_include 'Here\'s how sale proceeds work on ArtCaring'
    page.must_have_link(:"Frequently Asked Questions", :href => '/welcome/faq')
  end

  scenario 'visit "Learn" page' do
    visit welcome_learn_path
    page.text.must_include 'Here, artists sell their artwork to benefit a family member'
    page.text.must_include 'come together for the benefit of others'
  end

  scenario 'visit "Patient Campaigns index" page' do
    visit patient_campaigns_path
    page.text.must_include 'Patient Campaigns: Meet the People We\'re Helping...'
  end

  scenario 'visit "Artist index" page' do
    visit users_path
    page.text.must_include 'Artists: the Heroes of ArtCaring'
  end

  scenario 'visit "FAQ" page' do
    visit welcome_faq_path
    page.text.must_include 'described, or not what I had hoped?'
    page.text.must_include 'certain level of professionalism from the participating artists'
  end

  scenario 'visit "Contact Us" page' do
    visit new_message_path
    page.text.must_include 'Email'
    page.text.must_include 'Message'
    page.text.must_include 'Subject'
  end

end
