class ListsController < ApplicationController
  before_action :set_board, except: [:destroy]
  before_action :set_list, except: [:new, :create]

  def index
    @lists = @board.lists
    @tasks = @list.tasks
  end

  def show
  end

  def new
    @board = Board.find(params[:board_id])
    @list = @board.lists.new
  end

  def create
    @board = Board.find(params[:board_id])
    @list = @board.lists.create(list_params)
    if @list.save
      flash[:success] = "List Created"
      redirect_to @board
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:success] = "List Updated"
      redirect_to board_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    flash[:success] = "List Deleted"
    redirect_to user_boards_path(current_user)
  end

  private
    def set_board
      @board = current_user.boards.find(params[:board_id])
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :description, :board_id)
    end
end