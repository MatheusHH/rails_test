class AddDateFieldToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :schedule_date, :date
  end
end
