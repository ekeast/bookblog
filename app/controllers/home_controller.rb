class HomeController < ApplicationController
  def home
    @post = Post.order("created_at").last
  end
end
