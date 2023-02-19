class Public::UsersController < ApplicationController
  def mypage
    @user = User.find(current_customer.id)
    @posts = Post.find(current_customer.id)
    @draft_posts = Post.find(current_customer.id)
  end
  
end
