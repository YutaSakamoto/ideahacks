class DeclearsController < ApplicationController
  before_action :authenticate_user!, only:[:update,:create,:destroy]
  before_action :set_up

  def create
    @declear = @collection.declears.build(declear_params)
    @declear.user_id = current_user.id

    if @declear.save
      flash[:success] = "Nice"
      redirect_to collections_path(@collection)
    else
      render root_path
    end
  end

  def destroy
    @declear = Declear.find(params[:id])
    @declear.destroy

    redirect_back(fallback_location: request.referer)
  end

private
  def set_up
    @collection = Collection.find(params[:collection_id])
  end

  def declear_params
    params.require(:declear).permit(:comment)
  end
end
