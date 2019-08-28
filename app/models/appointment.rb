class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  OPTIONS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
end
