class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    user_id = User.find(params[:id]).id
    @user_board = Board.where(user_id: user_id).order(created_at: :desc)
  end

    # フォロー一覧を取得
  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
