class TaskService
  def self.create_task(params)
    if params[:queue] == 'quick' && Task.where(user_uuid: params[:user_uuid], queue: 'quick').count >= 5
      params[:queue] = 'grass'
    end

    Task.create(params)
  end
end
