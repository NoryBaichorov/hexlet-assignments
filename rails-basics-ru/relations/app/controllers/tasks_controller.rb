# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, except: %i[index new create]

  def index
    @tasks = Task.all_tasks_by_desc
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path
    else
      puts @task.errors.full_messages.join(' ')
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status_id, :user_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
