class MessagesController < ApplicationController
  before_action :find_message, only: [:edit, :update, :show, :destroy]

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
  end

  def edit
  end

  def update
    if @message.update(post_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def post_params
    params.require(:message).permit(:body)
  end
end
