class NewUrlPage
  include Capybara::DSL
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  def visit
    super(path)
  end

  def path
    new_url_path
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

  def error_css
    '.alert-box.alert.radius ul li'
  end

  def invalid_url_error
    t('activerecord.errors.models.url.attributes.long.invalid')
  end

  def blank_url_error
    t('activerecord.errors.models.url.attributes.long.blank')
  end

  def form_css
    'form#new_url'
  end

  def shortened_url_css
    '#shortened_url'
  end

  def add_another_css
    '#add_another'
  end

  def add_another_text
    t('urls.add_another')
  end

  def shortened_url
    url.shortened
  end

  def has_shortened_url?
    has_css?('#shortened_url', text: url.shortened)
  end

  private
  def url
    Url.last
  end
end
