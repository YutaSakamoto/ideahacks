class ReviewsController < ApplicationController
  before_action :authenticate_user!, only:[:update,:create,:destroy]
  before_action :set_up

  def create
    @review = @topic.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      flash[:success] = "Nice"
      redirect_to topics_path(@topic)
    else
      render root_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_back(fallback_location: request.referer)
  end

private
  def set_up
    @topic = Topic.find(params[:topic_id])
  end

  def review_params
    params.require(:review).permit(:comment, :star, :topic_id, :user_id)
  end
end
