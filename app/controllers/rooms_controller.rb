class RoomsController < ApplicationController
  def index
    @rooms = Room.where(user_id: current_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルーム登録完了しました"
      redirect_to :rooms
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def result
    if params[:address] == ''
      @addresses = Room.all
    elsif
      @addresses = Room.where('address LIKE ?','%' + params[:address] + '%' )
    end
  end

  def search
    if params[:search] == ''
      @searchs = Room.all
    else
      @searchs = Room.where('name LIKE ? OR introduction LIKE ? OR address LIKE ?','%'+params[:search]+'%','%'+params[:search]+'%','%'+params[:search]+'%')
    end
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address)
  end
end
