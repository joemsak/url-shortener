class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.save
  end

  private
  def url_params
    params.require(:url).permit(:long)
  end
end
