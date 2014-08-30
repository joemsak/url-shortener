require 'rails_helper'

feature 'Invalid URLs' do
  let(:page) { NewUrlPage.new }

  before { page.visit }

  scenario 'user sees the error for a blank URL', :js do
    page.fill_in_url_field(nil)
    page.submit_form
    expect(page).to have_css(page.error_css, text: page.blank_url_error)
  end

  scenario 'user sees the error for a non-URL', :js do
    ['http://bad', 'bad, just bad'].each do |bad|
      page.fill_in_url_field(bad)
      page.submit_form
      expect(page).to have_css(page.error_css, text: page.invalid_url_error)
    end
  end
end
