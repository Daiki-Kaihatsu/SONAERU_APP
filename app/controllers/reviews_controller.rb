class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @board = Board.find(params[:board_id])
    @reviews = @board.reviews
  end

  def create
    @review = Review.new(review_params)
    @board= Board.find(params[:board_id])
    @review.user_id = current_user.id
    if @review.save
      redirect_to board_path(@board)
    else
      @board= Board.find(params[:board_id])
      board_id = @board.id
      @board_material = BoardMaterial.where(board_id: board_id)
      render "boards/index"
    end
  end

  private

    def review_params
      params.require(:review).permit(:board_id,:user_id, :score, :content ,:review_image,:review_title)
    end
end
