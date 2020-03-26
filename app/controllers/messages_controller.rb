class MessagesController < ApplicationController
  before_action :set_coach

  def index
    @message = Message.new
    @messages = @coach.messages.includes(:user)
  end

  def create
    @message = @coach.messages.new(message_params)
    if @message.save
      redirect_to coach_messages_path(@coach), notice: 'メッセージが送信されました'
    else
      @messages = @coach.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_coach
    @coach = Coach.find(params[:coach_id])
  end
end