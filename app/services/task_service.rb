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

  def self.move_to_grass_catcher(task)
    task.update(queue: 'grass_catcher')
  end

  def self.move_to_quick(task)
    return false if Task.by_user_uuid(task.user_uuid).in_quick.count >= 5
    task.update(queue: 'quick')
  end

  def self.destroy(task)
    task.destroy
  end
end
