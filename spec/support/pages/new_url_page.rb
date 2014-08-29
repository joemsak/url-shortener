class NewUrlPage
  include Capybara::DSL
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  def visit
    super(new_url_path)
  end

  def fill_in_url_field(url)
    fill_in :url_long, with: url
  end

  def submit_form
    click_button t('forms.buttons.save')
  end

  def open_in_browser
    save_and_open_page
  end

  def has_shortened_url?
    url = Url.last
    has_css?('#shortened_url', text: url.shortened)
  end
end
