class TweetEvaluationsController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_evaluation = current_student.tweet_evaluations.build(tweet_id: @tweet.id, is_good: true)
    @tweet_evaluation.save
    render :toggle
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_evaluation = @tweet.tweet_evaluations.find_by(student_id: current_student.id)
    if @tweet_evaluation.is_good?
      @tweet_evaluation.destroy
      @tweet_evaluation = nil
      render :toggle
    end
  end

end
