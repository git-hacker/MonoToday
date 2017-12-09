class TasksController < ApplicationController
  layout 'mono_today'
  before_action :find_and_init_user_uuid

  def quick
    @queue = 'quick'
    @tasks = Task.where(user_uuid: @user_uuid, queue: 'quick')
  end

  def grass_catcher
    @queue = 'grass'
    @tasks = Task.where(user_uuid: @user_uuid, queue: 'grass')
  end

  def create
    TaskService.create_task(create_task_params.merge(user_uuid: @user_uuid))
    redirect_to :quick_tasks
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
