class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = current_user.appointments
  end

  def show
  end

  def new
    @appointment = current_user.appointments.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      flash[:success] = "Appointment Created"
      redirect_to appointments_path
    else
      flash[:error] = "Error #{@appointment.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path

  end

  private
    def appointment_params
      params.require(:appointment).permit(:weekday)
    end

    def set_appointment
      @appointment = current_user.appointments.find(params[:id])
    end

end
