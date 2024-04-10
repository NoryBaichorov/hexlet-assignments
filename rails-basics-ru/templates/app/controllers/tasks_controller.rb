# frozen_string_literal: true

class TasksController < ApplicationController
    before_action :find_task_by_id, except: [:index, :new, :create]

    def index
      @tasks = Task.all
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(tasks_params.merge(completed: true))
  
      if @task.save
        redirect_to task_path(@task)
        flash[:success] = 'Task has been successfully created!'
      else
        flash[:failure] = @task.errors.full_messages.join(' ')
        redirect_to new_task_path
      end
    end
  
    def show; end
  
    def edit; end
  
    def update
      if @task.update(tasks_params.merge(completed: true))
        flash[:success] = 'The task has been successfully updated'
        redirect_to task_path(@task)
      else
        flash[:failure] = @task.errors.full_messages.join(' ')
        redirect_to edit_task_path(@task)
      end
    end
  
    def destroy
      if @task.destroy
        flash[:success] = 'The task was successfully deleted'
        redirect_to tasks_path
      else
        redirect_to task_path(@task)
        flash[:failure] = @task.errors.full_messages.join(' ')
      end
    end
  
    private
  
    def tasks_params
      params.require(:task).permit(:name, :description, :status, :creator, :performer)
    end
  
    def find_task_by_id
      @task = Task.find(params[:id])
    end
  end
  