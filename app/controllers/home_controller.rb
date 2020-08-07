class HomeController < ApplicationController
  def index
    @category = Category.new
    @type = Type.new
    @bookmark = Bookmark.new
    @categories = Category.all
    @types = Type.all
    @bookmarks = Bookmark.all

  end
end
