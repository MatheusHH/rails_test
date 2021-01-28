class RemoveDateTimesFromSchedule < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :arrival_time, :datetime
    remove_column :schedules, :dinner_beginning_time, :datetime
    remove_column :schedules, :dinner_finishing_time, :datetime
    remove_column :schedules, :leaving_time, :datetime
  end
end
