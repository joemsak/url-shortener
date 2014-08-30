class Url < ActiveRecord::Base
  validates :long, presence: true,
    format: %r{\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z}

  def shortened
    ShortUrl.for(self)
  end
end
