class Url < ActiveRecord::Base
  before_save :prepend_missing_http

  validates :long, presence: true,
    format: %r{\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z}

  def shortened
    ShortUrl.for(self)
  end

  private
  def prepend_missing_http
    return true if long.match(/\Ahttp/)
    long.insert(0, 'http://')
  end
end
