class CommentEvaluationsController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment_evaluation = current_student.comment_evaluations.build(comment_id: @comment.id, is_good: true)
    @comment_evaluation.save
    render :toggle
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment_evaluation = @comment.comment_evaluations.find_by(student_id: current_student.id)
    if @comment_evaluation.is_good?
      @comment_evaluation.destroy
      @comment_evaluation = nil
      render :toggle
    end
  end

end
