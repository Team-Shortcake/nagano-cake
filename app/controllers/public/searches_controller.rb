class Public::SearchesController < ApplicationController
  def search
    @item = Item.search(params[:keyword])
    @keyword = params[:keyword]
  end
end
