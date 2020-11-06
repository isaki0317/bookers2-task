class ChatController < ApplicationController
  
  before_action :authenticate_user!, :only => [:create, :chow]

  def create
    @chat = current_user.chat.new(chat_params)
    @chat.save
    @room = @chat.room
    @chat_all = @room.chat
      # redirect_to chat_path(@message.room_id)
  end
  def show
    @room = Room.find(params[:id])
    if UserRoom.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.chat
      @message = Chat.new
      @entries = @room.user_rooms
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private

  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end
  
end
