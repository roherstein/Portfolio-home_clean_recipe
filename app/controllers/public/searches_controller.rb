class Public::SearchesController < ApplicationController
  def search
    @users = User.looks(params[:keyword])
    @posts = Post.looks(params[:keyword]).where(is_publish: true)
  end
end