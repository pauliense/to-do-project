class TasksController < ApplicationController

  def index
    @tasks = Task.all.own_task(current_user)
  end

  def new

  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end


  def update
    @task = Task.find(params[:id])
    @done = params[:task][:done]
    @task.done = @done

    if @task.save!
      redirect_to task_path(@task)
    else
      render :root_path
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:date, :name, :description, :user)
  end

end
