require 'rails_helper'

describe UrlsController do
  describe 'POST #create' do
    context 'when the URL has been entered before' do
      it 'returns the duplicate url' do
        url = create(:url)
        post :create, url: { long: url.long }, format: :js
        expect(assigns[:url]).to eq(url)
      end
    end
  end
end
