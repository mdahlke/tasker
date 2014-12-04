class TasksController < ApplicationController
  before_action :signed_in_user, only: [:create, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    redirect_to root_url
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
  def edit
    if correct_user
      @task = current_user.tasks.find_by(id: params[:id])
    else
      correct_user.inspect
    end
  end

  def update
      respond_to do |format|
        @task = current_user.tasks.build(task_params)
        if @task.update_attributes(task_params)
          format.html { redirect_to root_url, notice: 'Task was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @task.destroy
    redirect_to root_url
  end

  private
  
    def task_params
      params.require(:task).permit(:description, :category_id, :user_id)
    end
  
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to root_url if @task.nil?
    end
end
