# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#  status_id   :integer          not null
#
class Task < ApplicationRecord
  belongs_to :user

  belongs_to :status

  scope :all_tasks_by_desc, -> { order(created_at: :desc) }
end
