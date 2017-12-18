class TaskService
  def self.create_task(params)
    if params[:queue] == 'quick' && Task.by_user_uuid(params[:user_uuid]).in_quick.count >= 5
      params[:queue] = 'grass_catcher'
    end

    Task.create(params)
  end

  def self.complete(task)
    task.update(completed_at: Time.now)
  end
end
