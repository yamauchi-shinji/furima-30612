class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to "/items/#{message.item.id}"
  end
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
