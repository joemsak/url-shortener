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

  scenario 'in the form field and sees the shortened version on submit' do
    expect(page).to have_css(page.shortened_url_css, text: page.shortened_url)
  end

  scenario 'sees the option to add another' do
    expect(page).to have_link(page.add_another_css, href: page.path,
                                                    text: page.add_another_text)
  end
end
