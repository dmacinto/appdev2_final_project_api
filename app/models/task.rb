# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  body           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  commenter_id   :integer
#  completed_id   :boolean
#  in_progress_id :boolean
#  incomplete_id  :integer
#
class Task < ApplicationRecord
end
