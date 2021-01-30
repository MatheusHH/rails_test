class RemoveWeekdayFromSchedule < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :weekday, :integer
  end
end
