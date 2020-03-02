class MessagesController < ApplicationController
  before_action :set_trainer

  def index
    @message = Message.new
    @messages = @trainer.messages.includes(:user)
  end

  def create
    @message = @trainer.messages.new(message_params)
    if @message.save
      redirect_to trainer_messages_path(@trainer), notice: 'メッセージが送信されました'
    else
      @messages = @trainer.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end
end
