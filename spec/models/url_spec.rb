require 'rails_helper'

describe Url do
  describe '#shortened' do
    before { ENV['HOSTNAME'] = 'http://example.com/' }

    it 'combines the shortened_hash with the host' do
      url = build(:url, shortened_hash: 'foo')
      expect(url.shortened).to eq('http://example.com/foo')
    end
  end
end
