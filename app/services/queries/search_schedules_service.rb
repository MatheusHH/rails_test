module Queries
  class SearchSchedulesService < ApplicationService
    def call(user, params)
      @user = user
      @params = params

      search_schedules
      @schedules
    end

    private

    def search_schedules
      @schedules = @user.schedules.where(schedule_date: current_date.beginning_of_month..current_date.end_of_month)
      search_schedules_by_period if @params[:initial_date].present? && @params[:final_date].present? 
    end

    def search_schedules_by_period
      @schedules = @user.schedules.where(
        schedule_date: formatted_date(@params[:initial_date]).beginning_of_day..formatted_date(@params[:final_date]).end_of_day
      )
    end

    def formatted_date(date)
      new_date = Date.parse(date)
    end

    def current_date
      date = Date.today
    end
  end
end