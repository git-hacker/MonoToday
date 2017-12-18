# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  user_uuid    :string(255)      not null
#  title        :string(255)      not null
#  queue        :string(255)      not null
#  completed_at :datetime
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Task < ApplicationRecord
  validates :queue, inclusion: { in: %w(quick grass_catcher) }
  
  scope :by_user_uuid, lambda { |user_uuid|
    Task.where(user_uuid: user_uuid)
  }

  scope :in_quick, lambda { 
    Task.where(queue: 'quick', completed_at: nil)
  }

  scope :in_grass_catcher, lambda { 
    Task.where(queue: 'grass_catcher', completed_at: nil)
  }

  scope :in_completed, lambda { 
    Task.where.not(completed_at: nil)
  }
end
