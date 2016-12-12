class TasksController < ApplicationController

  def index
    @unfinished_tasks = Task.all.own_task(current_user).unfinished?
    @finished_tasks = Task.all.own_task(current_user).completed?
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to tasks_path
    else
      render 'pages/home'
    end
  end


  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @done = params[:task][:done]
    @task.done = @done
    @task.update(task_params)

    if @task.save
        if params[:commit] == "Mark task as done"
          redirect_to tasks_path,  notice: "#{@task.name} was marked as done!"
        else
          redirect_to task_path(@task), notice: "#{@task.name} was changed!"
        end
    else
      render :edit
    end
  end


  private

  def task_params
    params.require(:task).permit(:date, :name, :description, :user, :done, :category)
  end

end
