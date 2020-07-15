class FollowsController < ApplicationController

  def create
    @student = Student.find(params[:student_id])
    if current_student.follow(@student)
      render :toggle
    else
      redirect_to student_path(@student)
    end
  end

  def destroy
    @student = Student.find(params[:student_id])
    if current_student.unfollow(@student)
      render :toggle
    else
      redirect_to student_path(@student)
    end
  end

end
