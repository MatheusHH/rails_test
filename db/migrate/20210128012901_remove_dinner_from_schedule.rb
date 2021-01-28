class RemoveDinnerFromSchedule < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :dinner_beginning_time, :time
    remove_column :schedules, :dinner_finishing_time, :time
  end
end
