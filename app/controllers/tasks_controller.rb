class TasksController < ApplicationController
  layout 'mono_today'
  before_action :find_and_init_user_id

  def quick
    ap @user_id
  end

  def grass_catcher
    ap @user_id
  end

  private

  def find_and_init_user_id
    @user_id = cookies['user_id'] || ''
    if @user_id.strip.empty?
      @user_id = SecureRandom.uuid
      cookies[:user_id] = {
        value: @user_id,
        expires: 1.year.from_now,
      }
    end
  end
end
