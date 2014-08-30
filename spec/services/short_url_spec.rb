require './app/services/short_url'

describe ShortUrl do
  describe '.create' do
    it 'adds a shortened_hash to the url' do
      url = double(:url, save: true, long: 'http://fullurl')

      allow(Digest::SHA256).to receive(:hexdigest)
        .with('http://fullurl')
        .and_return('abc123456')

      expect(url).to receive(:shortened_hash=).with('abc12')
      ShortUrl.create(url)
    end
  end
end
