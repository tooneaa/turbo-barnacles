class ChatroomsController < ApplicationController

  def index
    @message = Message.all
  end

end
