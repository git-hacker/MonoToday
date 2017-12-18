class TaskService
  def self.create_task(params)
    if params[:queue] == 'quick' && Task.where(user_uuid: params[:user_uuid], queue: 'quick').count >= 5
      params[:queue] = 'grass-catcher'
    end

    Task.create(params)
  end

  def self.complete(task)
    task.update(completed_at: Time.now)
  end
end
