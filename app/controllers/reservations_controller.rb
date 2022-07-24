class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @price = @room.price * @reservation.people * (@reservation.end_day - @reservation.start_day).to_i
    @days = (@reservation.end_day - @reservation.start_day).to_i
  end
  
  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @price = @room.price * @reservation.people * (@reservation.end_day - @reservation.start_day).to_i
    if @reservation.save
      binding.pry
      flash[:notice] = "予約を確定しました"
      redirect_to reservation_path(@reservation.id)
    else
      binding.pry
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @price = @reservation.room.price * @reservation.people * (@reservation.end_day - @reservation.start_day).to_i
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_day, :end_day, :people, :room_id, :user_id)
  end
end
