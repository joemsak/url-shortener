class Url < ActiveRecord::Base
  def shortened
    ShortenedUrl.for(self)
  end
end
