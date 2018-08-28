class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all
    #@topics = Topic.where(active: true).limit(3)
  end

  def search
  end

  def new
    @topic = current_user.topics.build
    @topic.category_topic.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      redirect_to topics_path(@topic), success: "Saved..."
    else
      render :new, notice: "エラー"
  end
end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Saved..."
    else
      flash[:notice] = "エラー"
    end
      redirect_back(fallback_location: request.referer)
  end

  def show
    @topic = Topic.find(params[:id])
    @review = @topic.reviews.build
  end

private
  def topic_params
    params.require(:topic).permit(:title, :description, :category_ids)
  end

 end
