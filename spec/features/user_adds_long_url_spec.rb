require 'rails_helper'

feature 'User adds long url', :js do
  let(:url) { 'http://literally.com/doesnt-matter-but-its-long/okay/wow' }
  let(:page) { NewUrlPage.new }

  before do
    page.visit
    page.fill_in_url_field(url)
    page.submit_form
    wait_for_ajax
  end

  scenario 'user sees the shortened version on submit' do
    field = page.find_field(page.shortened_url_name)
    expect(field.value).to eq(page.shortened_url)
  end

  scenario 'user sees the option to add another' do
    expect(page).to have_link(page.add_another_text, href: page.path)
  end

  scenario 'user sees the form again on clicking add another' do
    click_link(page.add_another_text)
    wait_for_ajax
    expect(page).to have_css(page.form_css)
  end
end
