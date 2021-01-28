module Interns::SchedulesHelper
  def set_weekdays_list
    weekdays = Schedule.weekday_attributes_for_select
  end

  def formatted_hour time
    return "" if time.nil?
    time = time.strftime("às %H:%M")
  end

  def set_link_behavior
    return "" unless current_user.schedules.any?

    schedule = current_user.schedules.last
    if schedule.leaving_time.present?
      link_behavior = ""
    else
      link_behavior = "disabled"
    end
    link_behavior
  end
end