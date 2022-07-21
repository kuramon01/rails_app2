class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルーム登録完了しました"
      redirect_to :rooms
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :img_name)
  end
end
