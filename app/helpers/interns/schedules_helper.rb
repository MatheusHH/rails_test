module Interns::SchedulesHelper
  def formatted_hour time
    return "" if time.nil?
    time = time.strftime("às %H:%M")
  end

  def formatted_date date
    return "" if date.nil?
    date = date.strftime("%d/%m/%Y")
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

  def set_lunch_beginning_field(schedule, form)
    if schedule.arrival_time.present? 
      render partial: "lunch_beginning_field", locals: {form: form, schedule: schedule}
    end
  end

  def set_lunch_finishing_field(schedule, form)
    if schedule.lunch_beginning_time.present? 
      render partial: "lunch_finishing_field", locals: {form: form, schedule: schedule}
    end
  end

  def set_leaving_field(schedule, form)
    if schedule.lunch_finishing_time.present? 
      render partial: "leaving_field", locals: {form: form, schedule: schedule}
    end
  end
end