class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_initialize_by(long: url_params[:long])
    if @url.new_record?
      ShortUrl.create(@url)
      @url.save
    end
  end

  private
  def url_params
    params.require(:url).permit(:long)
  end
end
