require 'rails_helper'

describe Url do
  describe '#shortened' do
    it 'combines the shortened_hash with the host' do
      url = build(:url, shortened_hash: 'foo')
      expect(url.shortened).to eq('http://test.host/foo')
    end
  end
end
