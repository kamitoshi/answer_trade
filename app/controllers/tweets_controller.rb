class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end
  
  def create
    @community = Community.find(params[:community_id])
    @tweet = current_student.tweets.build(tweet_params)
    @tweet.community_id = @community.id
    if @tweet.save
      redirect_to community_path(@community)
    else
      render :new
    end
  end

  def destroy
    @community = Community.find(params[:community_id])
    @tweet = Tweet.find(params[:id])
    if @tweet.student == current_student
      if @tweet.destroy
        redirect_to community_path(@community)
      else
        redirect_to community_path(@community)
      end
    else
      flash[:danger] = "他の人の投稿を削除することはできません"
      redirect_to community_path(@community)
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:student_id, :community_id, :detail)
  end
end
