class CollectionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @collections = Collection.all
  end

  def new
    @collection = current_user.collections.build
  end

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      redirect_to collections_path
    else
      render :new, flash[:alert] = "エラー"
    end
  end

  def show
    @collection = Collection.find(params[:id])

  end

  private
    def collection_params
      params.require(:collection).permit(:title, :description)
    end

end
