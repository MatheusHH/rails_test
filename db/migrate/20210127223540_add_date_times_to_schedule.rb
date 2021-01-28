class AddDateTimesToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :arrival_time, :time
    add_column :schedules, :dinner_beginning_time, :time
    add_column :schedules, :dinner_finishing_time, :time
    add_column :schedules, :leaving_time, :time
  end
end
