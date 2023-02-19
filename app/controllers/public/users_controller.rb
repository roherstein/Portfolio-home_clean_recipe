class Public::UsersController < ApplicationController
  has_one_attached :profile_image
  
  def mypage
    @user = User.find(current_customer.id)
    @posts = Post.find(current_customer.id)
    @draft_posts = Post.find(current_customer.id)
  end
  
end
