class RakutenController < ApplicationController
  def look
    if params[:material]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:material])
    end
  end
end