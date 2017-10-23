class PagesController < ApplicationController
  def home
    @blogs = Blog.all
  end

  def authors
    @blogs = Blog.all
  end

  def titles
    @blogs = Blog.all
  end
end
