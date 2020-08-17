class UsersController < ApplicationController
  def index
    # @users = User.order(created_at: :desc).page(params[:page]).per(10)
    @users = User.order(created_at: :desc)
    binding.pry
  end

  def show
  end
end
