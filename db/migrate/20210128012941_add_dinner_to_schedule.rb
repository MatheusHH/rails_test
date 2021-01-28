class AddDinnerToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :lunch_beginning_time, :time
    add_column :schedules, :lunch_finishing_time, :time
  end
end
