require 'rails_helper'

describe UrlsController do
  describe 'GET #show' do
    context 'when the URL exists' do
      let!(:url) { create(:url, long: 'http://longurl.com',
                                shortened_hash: 'abc123') }

      it 'redirects to the long URL' do
        get :show, id: 'abc123'
        expect(response).to redirect_to('http://longurl.com')
      end
    end

    context 'when the URL does not exist' do
      it 'redirects to the new url page with an error flash' do
        get :show, id: 'foo'
        expect(response).to redirect_to(new_url_path)
        expect(flash[:alert]).to eq I18n.t('urls.errors.not_found')
      end
    end
  end

  describe 'POST #create' do
    context 'when the URL has been entered before' do
      it 'returns the duplicate url' do
        url = create(:url, shortened_hash: 'foobar')
        post :create, url: { long: url.long }, format: :js
        expect(assigns[:url]).to eq(url)
      end
    end
  end
end
