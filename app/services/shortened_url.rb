class ShortenedUrl
  def self.for(url)
    'http://test.host/' + url.shortened_hash
  end
end
