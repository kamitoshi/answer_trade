class ReplyTweetsController < ApplicationController

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @reply_tweet = ReplyTweet.new
  end
  
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply_tweet = current_student.reply_tweets.build(reply_tweet_params)
    @reply_tweet.tweet_id = @tweet.id
    if @reply_tweet.save
      flash[:seccess] = "返信しました"
      redirect_to tweet_path(@tweet)
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @reply_tweet = ReplyTweet.find(params[:id])
    if @reply_tweet.student == current_student
      if @reply_tweet.destroy
        flash[:danger] = "削除しました"
        redirect_to tweet_path(@tweet)
      else
        redirect_to tweet_path(@tweet)
      end
    else
      flash[:danger] = "他の人の返信を削除することはできません"
      redirect_to tweet_path(@tweet)
    end
  end

  private
  def reply_tweet_params
    params.require(:reply_tweet).permit(:student_id, :tweet_id, :detail)
  end
end
