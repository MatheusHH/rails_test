class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :weekday, default: 0
      t.datetime :arrival_time
      t.datetime :dinner_beginning_time
      t.datetime :dinner_finishing_time
      t.datetime :leaving_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
