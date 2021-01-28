class Interns::SchedulesController < DefaultInternsController
  before_action :set_schedule, only: [:edit, :update, :destroy]

  def index
    @schedules = current_user.schedules
  end

  def new
    @schedule = current_user.schedules.build
  end

  def edit
  end

  def create
    load_schedule
    if @schedule.save
      flash[:notice] = "Seu horário foi cadastrado com sucesso!"
      redirect_to interns_schedules_path
    else
      render :edit
    end
  end

  def update
    load_schedule
    if @schedule.save
      flash[:notice] = "Seu horário foi atualizado com sucesso!"
      redirect_to interns_schedules_path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    flash[:info] = "Seu horário foi deletado com sucesso!"
    redirect_to interns_schedules_path
  end

  private

  def load_schedule
    @schedule ||= current_user.schedules.build
    @schedule.attributes = schedule_params
  end

  def set_schedule
    @schedule = current_user.schedules.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:weekday, :arrival_time, :lunch_beginning_time,
                                     :lunch_finishing_time, :leaving_time)
  end
end