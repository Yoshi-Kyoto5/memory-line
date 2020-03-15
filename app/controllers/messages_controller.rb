class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @messages= Message.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
  end

  def edit
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
  end

  def show
   @comment = Comment.new
   @comments = @message.comments.includes(:user)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
  end
  private
  def message_params
    params.require(:message).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
