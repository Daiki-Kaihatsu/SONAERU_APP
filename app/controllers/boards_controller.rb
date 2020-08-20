class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @boards = Board.order(created_at: :desc)
  end

  def show
    @board= Board.find(params[:id])
    board_id = Board.find(params[:id]).id
    @board_material = BoardMaterial.where(board_id: board_id)
    @review = Review.new
  end

  def new
    @board = Board.new
    @board.board_details.build
    @board.board_materials.build
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      flash[:notice] = '投稿が完了しました' 
      redirect_to user_path(@board.user_id)
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def board_params
    params.require(:board).permit(:title,:image, tag_ids: [],board_details_attributes: [:id, :body, :image_detail, :_destroy],board_materials_attributes: [:id, :material, :quantity, :_destroy])
  end

end
