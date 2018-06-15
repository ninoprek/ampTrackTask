class MessagesController < ApplicationController
  def index
    @messages = Message.all.order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(post_params)
    if @message.save 
      redirect_to @message
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def post_params
    params.require(:message).permit(:body)
  end
end
