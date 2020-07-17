class ReplyCommentsController < ApplicationController
  
  def new
    @comment = Comment.find(params[:comment_id])
    @reply_comment = ReplyComment.new
  end
  
  def create
    @comment = Comment.find(params[:comment_id])
    @reply_comment = current_student.reply_comments.build(reply_comment_params)
    @reply_comment.comment_id = @comment.id
    if @reply_comment.save
      flash[:seccess] = "返信しました"
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @reply_comment = ReplyComment.find(params[:id])
    if @reply_comment.student == current_student
      if @reply_comment.destroy
        flash[:danger] = "削除しました"
        redirect_to comment_path(@comment)
      else
        redirect_to comment_path(@comment)
      end
    else
      flash[:danger] = "他の人の投稿を削除することはできません"
      redirect_to comment_path(@comment)
    end
  end

  private
  def reply_comment_params
    params.require(:reply_comment).permit(:student_id, :comment_id, :detail)
  end

end
