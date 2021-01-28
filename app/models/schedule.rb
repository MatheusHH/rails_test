class Schedule < ApplicationRecord
  belongs_to :user

  enum weekday: [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]

  validates :weekday, :arrival_time, presence: true
  validate :validate_lunch_beginning_time, if: :arrival_and_lunch_time_present?
  validate :validate_lunch_finishing_time, if: :lunch_times_present?
  validate :validate_leaving_time, if: :lunch_and_leaving_time_present?

  def self.weekday_attributes_for_select
    weekdays.map do |weekday, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.weekdays.#{weekday}"), weekday]
    end
  end

  private

  def arrival_and_lunch_time_present?
    arrival_time.present? && lunch_beginning_time.present?
  end

  def lunch_times_present?
    lunch_beginning_time.present? && lunch_finishing_time.present?
  end

  def lunch_and_leaving_time_present?
    lunch_finishing_time.present? && leaving_time.present?
  end

  def validate_lunch_beginning_time
    if lunch_beginning_time.nil? || current_time(lunch_beginning_time) <= current_time(arrival_time)
      errors.add(:lunch_beginning_time,": Ponto inválido, o horário é menor do que sua entrada")
    end
  end

  def validate_lunch_finishing_time
    if lunch_finishing_time.nil? || current_time(lunch_finishing_time) <= current_time(lunch_beginning_time)
      errors.add(:lunch_finishing_time,": Ponto inválido, o horário é menor do que sua saída p/ almoço")
    end
  end

  def validate_leaving_time
    if leaving_time.nil? || current_time(leaving_time) <= current_time(lunch_finishing_time)
      errors.add(:leaving_time,": Ponto inválido, o horário é menor do que sua entrada pós almoço")
    end
  end

  def current_time(time)
    time = Time.parse(time.strftime("%H:%M"))
  end
end
