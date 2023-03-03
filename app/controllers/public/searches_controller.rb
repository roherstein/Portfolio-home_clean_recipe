class Public::SearchesController < ApplicationController
  def search
    @users = User.looks(params[:keyword]).limit(10)
    @posts = Post.looks(params[:keyword]).limit(10)
  end
end