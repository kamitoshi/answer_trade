class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    @reply_comments = @comment.reply_comments.all.order(created_at: :desc)
  end

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    @comment.student_id = current_student.id
    if @comment.save
      # index.js.erbに飛ばす
      render :index
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:detail, :student_id, :video_id)
  end

end
