class ShortUrl
  def self.create(url)
    url.shortened_hash = first_five_of_sha256(url)
  end

  def self.for(url)
    ENV['HOSTNAME'] + url.shortened_hash
  end

  private
  def self.first_five_of_sha256(url)
    digest = Digest::SHA256.hexdigest(url.long)
    digest[0..4]
  end
end
