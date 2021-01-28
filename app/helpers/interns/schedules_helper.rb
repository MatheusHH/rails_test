module Interns::SchedulesHelper
  def set_weekdays_list
    weekdays = Schedule.weekday_attributes_for_select
  end

  def formatted_hour time
    return "" if time.nil?
    time = time.strftime("às %H:%M")
  end
end