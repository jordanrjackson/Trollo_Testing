class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = current_user.boards
  end

  def show
    @lists = @board.lists
  end

  def new
    @board = current_user.boards.new
  end

  def create
    @board = current_user.boards.create(board_params)
    if@board.save
      flash[:success] = "Board Created"
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      flash[:success] = "Board Updated"
      redirect_to @board
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    flash[:success] = "Board Deleted"
    redirect_to user_boards_path(current_user)
  end

  private
    def board_params
      params.require(:board).permit(:name, :description, :user_id)
    end

    def set_board
      @board = current_user.boards.find(params[:id])
    end
end