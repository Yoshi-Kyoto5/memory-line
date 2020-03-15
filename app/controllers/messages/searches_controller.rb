class Messages::SearchesController < ApplicationController
  def index
   @messages = Message.search(params[:keyword])
  end
end
