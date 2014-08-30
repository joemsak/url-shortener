class UrlsController < ApplicationController
  def show
    if @url = Url.find_by(shortened_hash: params[:id])
      redirect_to @url.long, status: 301
    else
      flash[:alert] = t('urls.errors.not_found')
      redirect_to new_url_path
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_initialize_by(long: url_params[:long])
    if @url.new_record?
      ShortUrl.create(@url)
    end
  end

  private
  def url_params
    params.require(:url).permit(:long)
  end
end
