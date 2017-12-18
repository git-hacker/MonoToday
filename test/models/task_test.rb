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

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
