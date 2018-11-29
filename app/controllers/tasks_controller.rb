class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, except: [:index, :new, :create]

  def index
    @tasks = @list.tasks.by_priority
  end

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.create(task_params)
    if @task.save
      flash[:success] = "Task Created"
      redirect_to list_tasks_path(@list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "Task Updated"
      redirect_to list_tasks_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "Task Deleted"
    redirect_to list_tasks_path(@list)
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :priority, :list_id)
  end
end