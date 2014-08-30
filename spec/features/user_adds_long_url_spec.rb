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
    expect(page).to have_css(page.shortened_url_css, text: page.shortened_url)
  end

  scenario 'user sees the option to add another' do
    expect(page).to have_link(page.add_another_css, href: page.path,
                                                    text: page.add_another_text)
  end

  scenario 'user sees the form again on clicking add another' do
    click_link(page.add_another_css)
    wait_for_ajax
    expect(page).to have_css(page.form_css)
  end
end
