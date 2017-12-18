class TasksController < ApplicationController
  layout 'mono_today'
  before_action :find_and_init_user_uuid

  def quick
    @queue = 'quick'
    @tasks = Task.by_user_uuid(@user_uuid).in_quick
  end

  def grass_catcher
    @queue = 'grass_catcher'
    @tasks = Task.by_user_uuid(@user_uuid).in_grass_catcher
  end

  def create
    @task = TaskService.create_task(create_task_params.merge(user_uuid: @user_uuid))
    respond_to do |format|
      format.js
    end
  end

  def complete
    @task = Task.find_by(id: params[:id], user_uuid: @user_uuid)
    TaskService.complete(@task)
    respond_to do |format|
      format.js
    end
  end

  private

  def find_and_init_user_uuid
    @user_uuid = cookies['user_uuid'] || ''
    if @user_uuid.strip.empty?
      @user_uuid = SecureRandom.uuid
      cookies[:user_uuid] = {
        value: @user_uuid,
        expires: 1.year.from_now,
      }
    end
  end

  # 创建 task 参数
  def create_task_params
    params.require(:task).permit(:title, :queue)
  end
end
