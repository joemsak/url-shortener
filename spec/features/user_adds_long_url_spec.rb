require 'rails_helper'

feature 'User adds long url', :js do
  scenario 'in the form field and sees the shortened version on submit' do
    url = 'http://lifehacker.com/top-10-superior-tech-products-youll-never-go-back-from-1625547811'
    page = NewUrlPage.new

    page.visit
    page.fill_in_url_field(url)
    page.submit_form

    sleep 0.5
    expect(page).to have_css('#shortened_url', text: Url.last.shortened)
  end
end
