require 'rails_helper'

describe Url do
  describe '#shortened' do
    it 'combines the shortened_hash with the host' do
      url = build(:url, shortened_hash: 'foo')
      expect(url.shortened).to eq('http://example.com/foo')
    end
  end

  describe 'before_save' do
    context 'if http:// is missing from #long' do
      it 'prepends http:// to #long' do
        url = create(:url)
        expect(url.long).to match(/http:\/\//)
        expect(url.long).to_not match(/http:\/\/http:\/\//)

        url = create(:url, long: 'google.com')
        expect(url.long).to eq('http://google.com')
      end
    end
  end
end
