class MessagesController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @match
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
            locals: { message: @message })
        end
        format.html { redirect_to booking_path(@booking) }
      end
    else
      render "matches/chat", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
